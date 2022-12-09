#!/bin/sh

# Creating CPIO archive
#find . -not -name '*.sh' -and -not -name 'initrd*' | cpio -o -R root:root -H newc | gzip -9 > initrd.gz
#find . -not -name '*.sh' -and -not -name 'initrd*' | cpio -o -R root:root -H newc | xz -9 --format=lzma > initrd.xz
#find . -not -name '*.sh' -and -not -name 'initrd*' | cpio -o -R root:root -H newc > initrd.cpio

qemu-system-x86_64 \
	-m 128 \
	-smp 1 \
	-net none \
    -serial mon:stdio \
    -kernel ~/app/linux-5.6.3/arch/x86/boot/bzImage \
    -initrd initrd.cpio \
    -nographic \
    -append "debug rw"
#    -bios /usr/share/ovmf/OVMF.fd \
