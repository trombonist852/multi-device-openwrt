《.github/workflows》里面的脚本部分说明

    REPO_URL: https://github.com/Lienol/openwrt （更换链接可以编译不一样大神的固件）
    REPO_BRANCH: master     （跟上面链接对应的分支，比如Lienol大神的就有dev-19.07跟dev-master分支，要编译什么固件就要写什么的）
    FEEDS_CONF: feeds.conf.default     （可以在根目录创建一个feeds.conf.default文件，也是自定义插件使用）
    CONFIG_FILE: diy.config     （自定义配置）
    DIY_OP_SH: diy.sh     （一些设置）
    SSH_ACTIONS: true     （SSH远程连接服务，true开,false关）
    UPLOAD_BIN_DIR: false     （上传BIN文件夹到github空,包含（固件+IPK）,跟上传固件二选一即可,true开,false关）
    UPLOAD_FIRMWARE: true     （上传固件到github空,跟上传BIN文件夹二选一即可,true开,false关）
    UPLOAD_COWTRANSFER: false     （上传固件到奶牛网盘,true开,false关）
    UPLOAD_WETRANSFER: false     （上传固件到WETRANSFER网盘,true开,false关）

    定时触发编译说明（utc时间对照表）
    (脚本使用的是utc时间)（5组数为 分-时-日-月-周，简单说明符号《*每》《/隔》《,分别》《-至》）点击了解
    cron: 30 8 * * *       这样表示每天编译一次，编译时间为utc时间8点30分开始
    cron: 30 8 */9 * *      这样表示每隔9天编译一次，编译时间为utc时间8点30分开始
    cron: 30 8 5,15,25 * *     这样表示每个月按你指定日期编译，现设的是5号-15号-25号编译，可设N天，编译时间为utc时间8点30分开始
    cron: 30 8 1-10 * *      这样表示每个月1至10号的每天编译一次，编译时间为utc时间8点30分开始

感谢 trombonist852
