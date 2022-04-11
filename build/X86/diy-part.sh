
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
sed -i 's/ImmortalWrt/Trb.Corp/g' package/base-files/files/bin/config_generate
sed -i 's#/bin/login#/bin/login -f root#g' feeds/packages/utils/ttyd/files/ttyd.config
sed -i 's#/bin/ash#/bin/bash#g' package/base-files/files/etc/passwd

#Modify Default Network Interface
sed -i '/ucidef_set_interface_lan/s/eth0/eth1 eth2 eth3/g' package/base-files/files/etc/board.d/99-default_network
sed -i '/ucidef_set_interface_wan/s/eth1/eth0/g' package/base-files/files/etc/board.d/99-default_network


#Modify Default Password
sed -i 's#root::0:0:99999:7:::#root:$1$fe9OTETj$lEJwiQW4hDxi/GNj4JUlC1:18679:0:99999:7:::#g' package/base-files/files/etc/shadow



#Add Package
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/custom/autotimeset
git clone https://github.com/1wrt/luci-app-ikoolproxy package/custom/luci-app-ikoolproxy
svn checkout https://github.com/trombonist852/custom/trunk/luci-app-filetransfer package/custom/luci-app-filetransfer-mod
svn export https://github.com/trombonist852/custom/trunk/sysinfo.sh package/emortal/default-settings/files/
svn co https://github.com/linkease/nas-packages/trunk/network/services/ddnsto package/custom/ddnsto
svn co https://github.com/linkease/nas-packages/trunk/network/services/linkease package/custom/linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto package/custom/luci-app-ddnsto
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease package/custom/luci-app-linkease

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile           # 选择argon为默认主题

# 修改插件名字
sed -i 's/"aMule设置"/"电驴下载"/g' `grep "aMule设置" -rl ./`
sed -i 's/"网络存储"/"NAS"/g' `grep "网络存储" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"实时流量监测"/"流量"/g' `grep "实时流量监测" -rl ./`
sed -i 's/"KMS 服务器"/"KMS激活"/g' `grep "KMS 服务器" -rl ./`
sed -i 's/"终端"/"命令窗"/g' `grep "终端" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"Web 管理"/"Web"/g' `grep "Web 管理" -rl ./`
sed -i 's/"管理权"/"改密码"/g' `grep "管理权" -rl ./`
sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`


sed -i "s/OpenWrt /${Author} compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ_PATH        # 增加个性名字${Author}默认为你的github账号


# 整理固件包时候,删除您不想要的固件或者文件,让它不需要上传到Actions空间
cat >${GITHUB_WORKSPACE}/Clear <<-EOF
rm -rf config.buildinfo
rm -rf feeds.buildinfo
rm -rf sha256sums
rm -rf version.buildinfo
EOF

