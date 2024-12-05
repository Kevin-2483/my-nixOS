#!/bin/bash

CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
source "$CONFIG_FILE"
if [ -z "${use_local_color+x}" ]; then
    export use_local_color=true
    echo "use_local_color=true" > "$CONFIG_FILE"
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "true" ]; then
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "false" ]; then
    source "$HOME/.cache/wallust/colors.sh"
fi

# 获取当前 SleepDisabled 的值
sleep_disabled=$(pmset -g | grep "SleepDisabled" | awk '{print $2}')

COFFEE=" 󰅶"
NOCOFFEE=" 󰾫"

source "$CONFIG_DIR/convert.sh"

BAR_COLOR=$color1

c2=$color2
c3=$color3

c2=$(convert_to_argb "$c2")
c3=$(convert_to_argb "$c3")

BAR_COLOR=$(convert_to_argb "$BAR_COLOR")

# 检查 SleepDisabled 的值并根据条件执行相应的命令
if [ "$sleep_disabled" -eq 0 ]; then
    echo "SleepDisabled 为 0，禁用睡眠模式..."
    sudo pmset -a disablesleep 1
    sketchybar --set "$NAME" icon="${COFFEE}" icon.color=$BAR_COLOR background.color=$c2
  else
    echo "SleepDisabled 不为 0，启用睡眠模式..."
    sudo pmset -a disablesleep 0
    sketchybar --set "$NAME" icon="${NOCOFFEE}" icon.color=$BAR_COLOR background.color=$c3
fi

