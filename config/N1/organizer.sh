#!/bin/bash

echo "Build Firmware"

git clone https://github.com/trombonist852/opt.git opt
git clone https://github.com/trombonist852/packit.git opt/openwrt_packit
cp -r -f dist/immortalwrt-armvirt-64-default-rootfs.tar.gz opt/openwrt_packit
cd opt/openwrt_packit
sudo ./mk_s905d_n1.sh
gzip output/*.img
mv output/*.img.gz ../dist/
