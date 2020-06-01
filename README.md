hypersolid bootloader for rescue systems (hybrid iso image)
=========================================================

**boot hypersolid via ISOLINUX**

Usage
-----------------

Put your system image files into the `system/` directory and modfiy the `conf/isolinux.cfg` config.

Finally run `./build.sh`

```
existing build environment removed
xorriso 1.5.0 : RockRidge filesystem manipulator, libburnia project.

Drive current: -outdev 'stdio:/mnt/dist/hypersolid.iso'
Media current: stdio file, overwriteable
Media status : is blank
Media summary: 0 sessions, 0 data blocks, 0 data, 74.8g free
Added to ISO image: directory '/'='/opt/build'
xorriso : UPDATE :       6 files added in 1 seconds
xorriso : UPDATE :       6 files added in 1 seconds
xorriso : NOTE : Copying to System Area: 432 bytes from file '/usr/lib/ISOLINUX/isohdpfx.bin'
libisofs: NOTE : Aligned image size to cylinder size by 250 blocks
ISO image produced: 512 sectors
Written to medium : 512 sectors at LBA 0
Writing to 'stdio:/mnt/dist/hypersolid.iso' completed successfully.

image created
```

References
-----------------

* [SYSLINUX WIKI](https://wiki.syslinux.org/wiki/index.php?title=ISOLINUX)

