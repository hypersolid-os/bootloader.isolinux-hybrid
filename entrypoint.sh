#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-2.0

# Fail on Error !
set -e

# container build ready - attach to interactive bash
if [ -f "/.buildready" ]; then
    # just start bash
    /bin/bash
    exit 0
else
    touch /.buildready
fi

# create mount point
mkdir -p /mnt/{conf,dist,system}

# create build dir
mkdir -p /opt/build/isolinux

# copy system files
cp /mnt/system/*.img /opt/build

# copy isolinux bin
cp /usr/lib/ISOLINUX/isolinux.bin /opt/build/isolinux

# copy lib
cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /opt/build/isolinux

# copy conf
cp /mnt/conf/* /opt/build/isolinux

# create iso
xorriso -as mkisofs \
  -o /mnt/dist/hypersolid.iso \
  -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
  -c isolinux/boot.cat \
  -b isolinux/isolinux.bin \
   -no-emul-boot -boot-load-size 4 -boot-info-table \
   /opt/build
