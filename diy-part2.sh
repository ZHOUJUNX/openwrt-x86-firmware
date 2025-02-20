#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
echo '### Updates default IP gate ###'
sed -i 's/192.168.1.1/172.16.253.254/g' package/base-files/luci2/bin/config_generate
echo '###  ###'

# echo '### Updates Theme Argon ###'
rm -rf package/feeds/luci/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
echo '###  ###'

echo '### Fixed Theme Argon /*# sourceMappingURL=cascade.css.map */ error ###'
sed -i 's|/\*# sourceMappingURL=cascade.css.map \*/||g' package/feeds/luci/luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
echo '###  ###'
