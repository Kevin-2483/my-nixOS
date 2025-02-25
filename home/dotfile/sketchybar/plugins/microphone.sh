#!/bin/bash

CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
COLOR_GROUP_FILE="$HOME/.cache/sketchybar/color_group.sh"
source "$CONFIG_FILE"
source "$COLOR_GROUP_FILE"
if [ "$use_local_color" = "true" ]; then
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "false" ]; then
    source "$HOME/.cache/wallust/colors.sh"
fi

microphone_volume=$(osascript -e "input volume of (get volume settings)")

microphone_on=" "
mute=" "

source "$CONFIG_DIR/convert.sh"

if [ "$color_group" = "0" ]; then
  BAR_COLOR=$color1
  c2=$color2
  c3=$color3
else
  BAR_COLOR=$color9
  c2=$color10
  c3=$color11
fi

c2=$(convert_to_argb "$c2")
c3=$(convert_to_argb "$c3")

BAR_COLOR=$(convert_to_argb "$BAR_COLOR")

# 检查 SleepDisabled 的值并根据条件执行相应的命令
if [ "$microphone_volume" -eq 0 ]; then
    echo "microphone_volume 为 0，设置为75..."
    osascript -e "set volume input volume 75"
    sketchybar --set "$NAME" icon="${microphone_on}" icon.color=$BAR_COLOR background.color=$c2
  else
    echo "microphone_volume 不为 0，设置为0..."
    osascript -e "set volume input volume 0"
    sketchybar --set "$NAME" icon="${mute}" icon.color=$BAR_COLOR background.color=$c3
fi