# ipxe

[![Build Status](https://travis-ci.org/katosys/ipxe.svg?branch=master)](https://travis-ci.org/katosys/ipxe)

This container is used to generate custom `iPXE` images in `PWD`.
Find below an `iPXE` example script:

```
➜ cat embedded.ipxe
#!ipxe

dhcp
set base-url http://stable.release.core-os.net/amd64-usr/current
kernel ${base-url}/coreos_production_pxe.vmlinuz coreos.autologin=tty1
initrd ${base-url}/coreos_production_pxe_image.cpio.gz
boot
```

#### Floppy image with a custom embedded script:

```
docker run -it --rm \
-v ${PWD}:/tmp \
quay.io/kato/ipxe \
bin/ipxe.dsk EMBED=/tmp/embedded.ipxe
```

#### ISO image with a custom embedded script:

```
docker run -it --rm \
-v ${PWD}:/tmp \
quay.io/kato/ipxe \
bin/ipxe.iso EMBED=/tmp/embedded.ipxe
```

#### USB image with a custom embedded script:

```
docker run -it --rm \
-v ${PWD}:/tmp \
quay.io/kato/ipxe \
bin/ipxe.usb EMBED=/tmp/embedded.ipxe
```
