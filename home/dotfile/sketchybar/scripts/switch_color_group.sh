#!/bin/sh

COLOR_GROUP_FILE="$HOME/.cache/sketchybar/color_group.sh"
source "$COLOR_GROUP_FILE"

if [ "$color_group" = "0" ]; then
  echo "color_group=1" > "$COLOR_GROUP_FILE"
else
  echo "color_group=0" > "$COLOR_GROUP_FILE"
fi

sketchybar --reload