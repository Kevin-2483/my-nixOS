#!/bin/bash

TITLE_MARGIN=11
INFO_WIDTH=60
BAR_HEIGHT=34

# 太陽曆组件
calendar=(
  label="calendar"
  drawing=on
  # label.color=$MUSIC_LABEL_COLOR
  icon.drawing=off
  label.align=left
  label.width=$INFO_WIDTH
  label.font="B2花園:Medium:10.0"
  padding_left=-$INFO_WIDTH
  padding_right=0
  y_offset=$((BAR_HEIGHT / 2 - TITLE_MARGIN))
)

#月曆组件
lunar=(
  label="lunar"
  drawing=on
  # label.color=$MUSIC_ICON_COLOR
  icon.drawing=off
  label.align=left
  label.width=$INFO_WIDTH
  label.font="B2花園:Medium:9.0"
  padding_left=0
  padding_right=0
  y_offset=$((-BAR_HEIGHT / 2 + TITLE_MARGIN))
)

sketchybar --add item clock right \
           --set clock update_freq=1  script="$PLUGIN_DIR/clock.sh" \
           --set clock icon.color=$color5 \
           --set clock label.color=$color5


sketchybar --add item calendar right \
           --set calendar "${calendar[@]}" \
           --set calendar icon.color=$color8 \
           --set calendar label.color=$color8

sketchybar --add item lunar right \
           --set lunar "${lunar[@]}" \
           --set lunar icon.color=$color6 \
           --set lunar label.color=$color6

sketchybar --add item moon right \
           --set moon padding_right=0 icon.padding_right=0 \
           --set moon icon.color=$color6 \
           --set moon label.color=$color6

sketchybar --add item clock_separator right \
           --set clock_separator icon="⎪" \
           --set clock_separator icon.color=$color3 \
           --set clock_separator label.color=$color3
