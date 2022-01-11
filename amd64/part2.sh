#!/bin/bash

rm -rf package/lean/luci-theme-argon  #删除源码自带的argon主题，因为最下面一个链接是增加了其他作者制作的argon主题

#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
git clone https://github.com/kenzok8/openwrt-packages opks
mv opks/* package/
rm -rf opks/
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge package/luci-theme-edge  #主题-edge-动态登陆界面
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom  #透明主题
#git clone -b master https://github.com/vernesong/OpenClash.git package/luci-app-openclash  #openclash出国软件
#git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash  #clash出国软件
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan  #微信推送
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns  #smartdns DNS加速
#git clone https://github.com/garypang13/luci-app-eqos package/luci-app-eqos  #内网IP限速工具
git clone https://github.com/yangsongli/luci-theme-atmaterial.git package/luci-theme-atmaterial #atmaterial主题
#luci-app-compressed-memory 
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter #应用过滤/家长控制

#passwall出国软件
#git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall


#Hello World
git clone https://github.com/jerrykuku/lua-maxminddb.git  package/lua-maxminddb #git lua-maxminddb 依赖
#git clone https://github.com/jerrykuku/luci-app-vssr.git  package/luci-app-vssr

#xray
git clone https://github.com/yichya/luci-app-xray package/luci-app-xray

git clone https://github.com/jerrykuku/node-request.git package/node-request  #京东签到依赖
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus  #luci-app-jd-dailybonus[京东签到]


git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon  #argon-主题
#全新的[argon-主题]登录界面,图片背景跟随Bing.com，每天自动切换
#增加可自定义登录背景功能，请自行将文件上传到/www/luci-static/argon/background 目录下，支持jpg png gif格式图片，主题将会优先显示自定义背景，多个背景为随机显示，系统默认依然为从bing获取
#增加了可以强制锁定暗色模式的功能，如果需要，请登录ssh 输入：touch /etc/dark 即可开启，关闭请输入：rm -rf /etc/dark，关闭后颜色模式为跟随系统