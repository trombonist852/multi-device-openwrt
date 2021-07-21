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
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#Modify Router Name
sed -i 's/OpenWrt/Trb.Corp/g' package/base-files/files/bin/config_generate

#Modify Default Network Interface
sed -i '/ucidef_set_interface_lan/s/eth0/eth1 eth2 eth3 eth4 eth5/g' package/base-files/files/etc/board.d/99-default_network
sed -i '/ucidef_set_interface_wan/s/eth1/eth0/g' package/base-files/files/etc/board.d/99-default_network

#Modify Default Password
sed -i 's#root::0:0:99999:7:::#root:$1$fe9OTETj$lEJwiQW4hDxi/GNj4JUlC1:18679:0:99999:7:::#g' package/base-files/files/etc/shadow

#Modify Boot Disk(for X86)
#sed -i 's/hd0/hd2/g' target/linux/x86/image/grub-efi.cfg

sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile

#Compile K3 Only
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile

#Del package
rm -rf package/lean/qBittorrent
rm -rf package/lean/qt5
rm -rf package/diy/OpenAppFilter
rm -rf package/lean/luci-app-filetransfer
rm -rf package/lean/k3screenctrl
rm -rf package/diy/luci-app-dockerman
rm -rf package/kernel/r8125

# Install to emmc
#git clone https://github.com/tuanqing/install-program package/install-program

# Theme
git clone https://github.com/jerrykuku/luci-theme-argon.git package/custom/luci-theme-argon-19.07
#rm -rf package/custom/luci-theme-argon-19.07/luasrc/view/themes/argon/footer.htm
#rm -rf package/custom/luci-theme-argon-19.07/luasrc/view/themes/argon/header.htm
#svn export https://github.com/trombonist852/custom/trunk/footer.htm package/custom/luci-theme-argon-19.07/luasrc/view/themes/argon/
#svn export https://github.com/trombonist852/custom/trunk/header.htm package/custom/luci-theme-argon-19.07/luasrc/view/themes/argon/

#Add Package
git clone https://github.com/tty228/luci-app-serverchan.git package/custom/serverchan
git clone https://github.com/wltc2005/openwrt-redsocks2.git package/custom/redsocks2
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/custom/argon-config
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/custom/autotimeset
git clone https://github.com/lwz322/k3screenctrl.git package/custom/k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/custom/luci-app-k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/custom/k3screenctrl_build
git clone https://github.com/godros/luci-app-godproxy.git package/custom/luci-app-godproxy

#Add files
#mkdir package/base-files/files/etc/modules.d
#svn export https://github.com/maxlicheng/phicomm-n1-wireless/trunk/wireless_enable package/base-files/files/etc/modules.d/
svn checkout https://github.com/openwrt/luci/trunk/applications/luci-app-dockerman package/diy/luci-app-dockerman
svn checkout https://github.com/trombonist852/custom/trunk/luci-app-filetransfer package/custom/luci-app-filetransfer
svn checkout https://github.com/trombonist852/custom/trunk/r8125-9.005.06 package/custom/r8125
