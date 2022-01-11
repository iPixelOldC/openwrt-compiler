#!/bin/bash

svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i 'N;24a\tools-y += ucl upx' tools/Makefile
sed -i 'N;40a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile

# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#

# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate


sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings  #设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）


#内核版本是会随着源码更新而改变的，在coolsnowwolf/lede的源码查看最好，以X86机型为例，源码的target/linux/x86文件夹可以看到有几个内核版本，x86文件夹里Makefile就可以查看源码正在使用什么内核
#修改版本内核（下面两行代码前面有#为源码默认最新5.4内核,没#为4.19内核,默认修改X86的，其他机型L大源码那里target/linux查看，对应修改下面的路径就好）
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本


#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用源码自带ShadowSocksR Plus+出国软件

# Modify DHCP client for iptv
sed -i 's/\${vendorid:+-V "$vendorid"}/-V \"\"/g' package/network/config/netifd/files/lib/netifd/proto/dhcp.sh
