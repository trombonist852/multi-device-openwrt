Frok 来自https://github.com/P3TERX/Actions-OpenWrt 大佬的云编译项目，每周五下午自动更新固件
自编译x86等多设备固件，集成小宝的易有云、ddnsto
固件 OpenWRT 官改固件 插件中心

支持树莓派全系、斐讯N1、NanoPi R2s。
同步Li大神的源码地址：https://github.com/Lienol/openwrt
更新为21.02分支，最新内核

一、刷机须知
注意1：请刷机的朋友认真阅读本帖！！！刷机带来的风险请自行承担！！！
注意2：欢迎转载本帖，但是请一定尊重开发组的成果，注明本帖来源！！！

1.x86固件适合多网口软路由（网口≥2），eth0对应软路由第一个网口为wan口，eth1对应软路由第二个网口为lan口，如果是单网口软路由，刷好后请自行更改接口定义。默认地址192.168.1.1，登录密码koolshare。

2.如果使用efi固件，刷好后请自行到efi分区，更改grub.cfg文件内的第五行set root='(hd3,gpt1)'，为系统所在盘的编号。

如果软路由只有一块硬盘就是hd0；本人有4块硬盘，系统刷在编号为hd3的ssd上，所以就是hd3,才会成功启动，如果选传统引导正常刷即可。


N1固件刷入U盘启动之后执行n1-install即可安装到emmc。将固件解压为img格式，上传到/tmp/upgrade之后执行n1-update即可从该固件升级。此步骤借鉴@tuanqing大佬的方法地址https://github.com/tuanqing/mknop

二、固件功能特性
1.加入interCPU核显驱动
ls/dev/dri后会看到card0 renderD128，说明核显加载成功。配合docker里的jellyfin硬解转码使用，使网络播放高清视频更加流畅不卡顿，cpu占用率更少


2.集成小宝的易有云、ddnsto。
易有云提供全平台的文件管理、数据备份和文件单/双向同步等核心功能，支持远程访问，并且已经拥有了PC、Mac、ios、TV、NAS、路由器等多个平台的客户端，超好用 ！
易有云客户端下载 https://github.com/koolshare/linkease
易有云绑定教程 https://www.ddnsto.com/linkease/#/zh-cn/tutorial/NAS/BindingSoftware
DDNSTO官方网站：https://www.ddnsto.com/
关于单网口路由器修改网口定义教程：

op启动跑完码后按回车进入shell，输入vi /etc/config/network后回车，按i进入编辑模式。找到第config interface 'lan'（如果没有的话自己添加），把里面的内容修改为：

config interface 'lan'
        option type 'bridge'
        option proto 'static'
        option ipaddr '192.168.1.1'
        option netmask '255.255.255.0'
        option multipath 'off'
        option ifname 'eth1'
        option delegate '0'
把config interface 'wan’和里面的内容删掉，按:wq存并退出，不保存退出是:q!,之后重启路由器就可以访问luci界面了。

下载地址：
https://github.com/trombonist852/multi-device-openwrt/releases
