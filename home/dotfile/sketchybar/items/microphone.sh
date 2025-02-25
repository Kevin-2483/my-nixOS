#!/bin/bash

# source "$CONFIG_DIR/colors.sh"

# 获取当前 SleepDisabled 的值
microphone_volume=$(osascript -e "input volume of (get volume settings)")

microphone_on=" "
mute=" "

if [ "$color_group" = "0" ]; then
  c1=$color2
  c2=$color3
else
  c1=$color10
  c2=$color11
fi


# 检查 SleepDisabled 的值并根据条件执行相应的命令
if [ "$microphone_volume" -eq 0 ]; then
    sketchybar --add item microphone right \
           --set microphone click_script="$PLUGIN_DIR/microphone.sh" \
           label.drawing=off \
           icon.padding_right=13 \
           background.corner_radius=15 \
           background.height=24 \
           icon="${mute}" \
           icon.color=$BAR_COLOR \
           background.color=$c2 # background.padding_left=10 
  else
    sketchybar --add item microphone right \
           --set microphone click_script="$PLUGIN_DIR/microphone.sh" \
           label.drawing=off \
           icon.padding_right=15 \
           background.corner_radius=15 \
           background.height=24 \
           icon="${microphone_on}" \
           icon.color=$BAR_COLOR \
           background.color=$c1 # background.padding_left=10 
fi

