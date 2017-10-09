#!/bin/sh
rm -r busybox_installed

cp ../../Source/busybox-*.tar.bz2 busybox.tar.bz2
tar -xvf busybox.tar.bz2
cd $(ls -d busybox-*)
make distclean -j 32
make defconfig -j 32
sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config
make \
  EXTRA_CFLAGS="-Os -s -fno-stack-protector -fomit-frame-pointer -U_FORTIFY_SOURCE -pipe" \
  busybox -j 32
make \
  CONFIG_PREFIX="../busybox_installed" \
  install -j 32
cd ..
rm -r busybox-*/
