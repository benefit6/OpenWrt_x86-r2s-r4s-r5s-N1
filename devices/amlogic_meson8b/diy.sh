#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

bash $SHELL_FOLDER/../common/kernel_6.1.sh

git_clone_path master https://github.com/coolsnowwolf/lede target/linux/amlogic package/boot/uboot-amlogic

sed -i 's/+uci-firewall/+firewall/g' feeds/luci/applications/luci-app-firewall/Makefile
sed -i "s/192.168.1.1/192.168.3.10/" package/base-files/files/bin/config_generate
sed -i "s/wpad-openssl/wpad-basic-mbedtls/" target/linux/amlogic/image/meson8b.mk
sed -i "s/%D %V %C/%D $(TZ=UTC-8 date +%Y.%m.%d)/" package/base-files/files/etc/openwrt_release
sed -i "s/%R/by Benefit66/" package/base-files/files/etc/openwrt_release



