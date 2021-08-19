#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

#Modify Router Name
sed -i 's/OpenWrt/Trb.Corp/g' package/base-files/files/bin/config_generate

#Modify Default Network Interface
sed -i '/ucidef_set_interface_lan/s/eth0/eth1 eth2 eth3 eth4 eth5/g' package/base-files/files/etc/board.d/99-default_network
sed -i '/ucidef_set_interface_wan/s/eth1/eth0/g' package/base-files/files/etc/board.d/99-default_network

#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile

#Modify Default Password
sed -i 's#root::0:0:99999:7:::#root:$1$fe9OTETj$lEJwiQW4hDxi/GNj4JUlC1:18679:0:99999:7:::#g' package/base-files/files/etc/shadow

#Modify Boot Disk(for X86)
#sed -i 's/hd0/hd2/g' target/linux/x86/image/grub-efi.cfg

#Del package
rm -rf package/diy/OpenAppFilter
rm -rf package/lean/luci-app-filetransfer
rm -rf package/lean/k3screenctrl
rm -rf package/diy/luci-app-dockerman

# Theme
git clone https://github.com/jerrykuku/luci-theme-argon.git package/custom/luci-theme-argon-19.07

#Add Package
git clone https://github.com/tty228/luci-app-serverchan.git package/custom/serverchan
git clone https://github.com/wltc2005/openwrt-redsocks2.git package/custom/redsocks2
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/custom/argon-config
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/custom/autotimeset
git clone https://github.com/godros/luci-app-godproxy.git package/custom/luci-app-godproxy
git clone https://github.com/xiaorouji/openwrt-passwall.git package/custom/openwrt-passwall
git clone https://github.com/linkease/nas-packages.git package/custom/nas-packages
git clone https://github.com/destan19/OpenAppFilter.git package/custom/OpenAppFilter

#Add files
svn checkout https://github.com/openwrt/luci/trunk/applications/luci-app-dockerman package/diy/luci-app-dockerman
svn checkout https://github.com/trombonist852/custom/trunk/luci-app-filetransfer package/custom/luci-app-filetransfer
svn checkout https://github.com/trombonist852/custom/trunk/r8125-9.005.06 package/custom/r8125-9.005.06
svn checkout https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/custom/luci-app-ssr-plus

sed -i 's#include ../../luci.mk#include $(TOPDIR)/feeds/luci/luci.mk#g' package/diy/luci-app-dockerman/Makefile
