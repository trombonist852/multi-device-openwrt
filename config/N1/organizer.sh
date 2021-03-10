#!/bin/bash

echo "Build Firmware"

git clone https://github.com/ylqjgm/mknop.git mknop
mkdir -p mknop/openwrt
cp -r -f dist/openwrt-armvirt-64-default-rootfs.tar.gz mknop/openwrt/
cd mknop
sudo ./gen_openwrt -s 1536 -d -k 5.4.98 -m phicomm-n1
gzip out/phicomm-n1/*.img
mv out/phicomm-n1/*.img.gz ../dist/
