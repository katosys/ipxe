# ipxe

[![Build Status](https://travis-ci.org/katosys/ipxe.svg?branch=master)](https://travis-ci.org/katosys/ipxe)

This container is used to generate custom `iPXE` images with embedded scripts.
Given the `iPXE` script below...

```
#!ipxe
dhcp && chain http://boot.kato/ipxe?roles=quorum,master,worker
```

...floppy, ISO and USB images can be generated using the examples below:

#### Floppy image with a custom embedded script:

```
docker run -it --rm \
-v ${PWD}:/tmp \
quay.io/kato/ipxe \
bin/ipxe.dsk EMBED=/tmp/embedded.ipxe
```

#### ISO image with a custom embedded script:

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

### VirtualBox tips:

Using the host's resolver as a DNS proxy in VirtualBox NAT mode:

```
VBoxManage modifyvm ${VM_NAME} --natdnshostresolver1 on
```

Now you can edit the host's `/etc/hosts` and add some fake records such as:

```
7.7.7.7 boot.kato
```
