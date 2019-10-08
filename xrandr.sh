#!/bin/bash
# Program:
# This program switch screen
# History:
# 2019/10/08	keke	First release
echo -e "0.查看接口情况1.快速关闭小米笔记本显示器 2.快速关闭x220显示器\n"
read -p "请输入你要执行的操作\n" choose
[ "${choose}" == "1" ] && echo "OK, You Choose 1" && exit 0
[ "${choose}" == "2" ] && echo "OK, You Choose 2" && exit 0
[ "${choose}" == "0" ] && xrandr | grep 'connected'| cut -d ' ' -f1 && exit 0
