#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# 获取当前 SleepDisabled 的值
sleep_disabled=$(pmset -g | grep "SleepDisabled" | awk '{print $2}')

COFFEE=" 󰅶"
NOCOFFEE=" 󰾫"
# 检查 SleepDisabled 的值并根据条件执行相应的命令
if [ "$sleep_disabled" -eq 0 ]; then
    echo "SleepDisabled 为 0，禁用睡眠模式..."
    sudo pmset -a disablesleep 1
    sketchybar --set "$NAME" icon="${COFFEE}" icon.color=$BAR_COLOR background.color=$PINK
  else
    echo "SleepDisabled 不为 0，启用睡眠模式..."
    sudo pmset -a disablesleep 0
    sketchybar --set "$NAME" icon="${NOCOFFEE}" icon.color=$BAR_COLOR background.color=$GREEN
fi

