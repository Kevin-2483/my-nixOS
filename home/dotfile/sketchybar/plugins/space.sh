#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
COLOR_GROUP_FILE="$HOME/.cache/sketchybar/color_group.sh"
source "$CONFIG_FILE"
source "$COLOR_GROUP_FILE"
if [ "$use_local_color" = "true" ]; then
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "false" ]; then
    source "$HOME/.cache/wallust/colors.sh"
fi

source "$CONFIG_DIR/convert.sh"

if [ "$color_group" = "0" ]; then
  BAR_COLOR=$color1
  c1=$color4
  c2=$color2
else
  BAR_COLOR=$color9
  c1=$color12
  c2=$color10
fi

BAR_COLOR=$(convert_to_argb "$BAR_COLOR")
c1=$(convert_to_argb "$c1")
c2=$(convert_to_argb "$c2")

if [ $SELECTED = true ]; then
  # 选中状态：显示背景，设置颜色
  sketchybar --animate tanh 15 --set $NAME background.drawing=on \
                         background.color=$c2 \
                         background.height=24 \
                         background.corner_radius=13 \
                         background.y_offset=0 \
                         label.color=$BAR_COLOR \
                         icon.color=$BAR_COLOR
else
  # 非选中状态：保持背景可见但颜色透明
  sketchybar --animate tanh 15 --set $NAME background.drawing=on \
                         background.color=0x00000000 \
                         label.color=$c1 \
                         icon.color=$c1
fi
