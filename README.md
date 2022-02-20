提示：
N1固件，从版本69开始， 把 mmcblk2p2、mmcblk2p3、mmcblk2p4的分区起始位置依次向后偏移了4MB,经测试已修复BTRFS csum failed BUG，此BUG会导致不能拨号，科学不正常，不能turbo acc加速等多种问题，必须按下列方法解决（2选1）
1. 由于分区布局发生了变化，必须通过U盘启动全新刷机才算是真正修复
2. 不想重刷的，在线升级后用df -h /查看所在的分区，如果在mmcblk2p2上的，需要再升级一次，保证rootfs在mmcblk2p3分区上才能避免 btrfs csum failed
如果喜欢本项目请点亮stars支持，开发不易，您的支持就是我的动力
ps.由于是上游代码更新同步编译,如果发现当前版本有bug,那就找之前的无bug版本刷入即可
