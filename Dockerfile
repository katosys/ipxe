#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM alpine:3.5
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

ENV VERSION="master"

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN apk --no-cache add -U git make gcc musl-dev perl xz-dev bash cdrkit syslinux \
    && cd /tmp && git clone https://github.com/ipxe/ipxe.git . \
    && git checkout ${VERSION} -b build; mkdir /ipxe \
    && git archive ${VERSION} | tar -xC /ipxe && cd /ipxe/src && make \
    && rm -rf /tmp/* /var/cache/apk/*

COPY /rootfs /

#------------------------------------------------------------------------------
# Entrypoint:
#------------------------------------------------------------------------------

WORKDIR /ipxe/src
ENTRYPOINT ["/init"]
