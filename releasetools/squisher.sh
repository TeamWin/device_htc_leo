#!/bin/sh
#
# Squish a CM otapackage for distribution
# cyanogen
#

# Doing leo specific stuff

echo "Making Leo Compatible Update script"
cd $REPACK/ota/META-INF/com/google/android
echo 'mount("yaffs2", "MTD", "boot", "/boot");' >> temp
echo 'package_extract_dir("boot", "/boot");' >> temp
grep -vw assert  updater-script >> temp
rm -rf updater-script
grep -vw boot.img  temp > updater-script
rm -rf temp

echo Zipping Package
cd $REPACK/ota
rm -rf $REPACK/ota/boot.img
rm -rf $REPACK/ota/boot
cp -a $OUT/boot $REPACK/ota/boot

if [[ ! -e $OUT/temp/boot/initrd.gz ]] ; then
  cp -a $OUT/ramdisk.img $OUT/temp/boot/initrd.gz
fi

exit 0
