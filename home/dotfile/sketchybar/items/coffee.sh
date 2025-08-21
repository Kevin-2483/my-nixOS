#!/bin/bash

# source "$CONFIG_DIR/colors.sh"

# 获取当前 SleepDisabled 的值
sleep_disabled=$(pmset -g | grep "SleepDisabled" | awk '{print $2}')

COFFEE=" 󰅶"
NOCOFFEE=" 󰾫"

if [ "$color_group" = "0" ]; then
  c1=$color2
  c2=$color3
else
  c1=$color10
  c2=$color11
fi


# 检查 SleepDisabled 的值并根据条件执行相应的命令
if [ "$sleep_disabled" -eq 0 ]; then
    sketchybar --add item coffee right \
           --set coffee click_script="$PLUGIN_DIR/coffee.sh" \
           label.drawing=off \
           icon.padding_right=16 \
           background.corner_radius=15 \
           background.height=24 \
           icon="${NOCOFFEE}" \
           icon.color=$BAR_COLOR \
           background.color=$c2 # background.padding_left=10 
  else
    sketchybar --add item coffee right \
           --set coffee click_script="$PLUGIN_DIR/coffee.sh" \
           label.drawing=off \
           icon.padding_right=16 \
           background.corner_radius=15 \
           background.height=24 \
           icon="${COFFEE}" \
           icon.color=$BAR_COLOR \
           background.color=$c1 # background.padding_left=10 
fi

