#!/bin/bash

if [ "$color_group" = "0" ]; then
  s1=$color3
  s2=$color4
  s3=$color5
  s0=$color1
else
  s1=$color11
  s2=$color12
  s3=$color13
  s0=$color9
fi



sketchybar --add item yabai left                                           \
           --set ya ba ch label="" icon=" " icon.color=$s3 label.color=$s1  \
                 click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
                 popup.background.border_width=2                                \
                 popup.background.corner_radius=20                              \
                 popup.background.border_color=$s3                              \
                 popup.background.color=$s0                                     \
                 popup.background.drawing=on                                    \
                 popup.y_offset=6                                               \
            --add item yabai.use_local_color popup.yabai              \
            --set yabai.use_local_color label="使用生成的配色  " icon="󰁨 " icon.color=$s0 label.color=$s0  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="$SCRIPT_DIR/use_local_theme.sh" \
                  background.drawing=on \
                  background.corner_radius=15 \
                  background.color=$s3 \
            --add item yabai.color_group popup.yabai                  \
            --set yabai.color_group label="切换颜色组  " icon=" " icon.color=$s3 label.color=$s1  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="$SCRIPT_DIR/switch_color_group.sh" \
            --add item yabai.reload popup.yabai                       \
            --set yabai.reload label="刷新  " icon=" " icon.color=$s3 label.color=$s1  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="sketchybar --reload" \
            --add item yabai.gen_theme popup.yabai             \
            --set yabai.gen_theme label="生成主题  " icon="󰽉 " icon.color=$s3 label.color=$s1  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="$SCRIPT_DIR/gen_theme.sh"

if [ "$use_local_color" = "true" ]; then
    sketchybar --set yabai.use_local_color background.drawing=off icon.color=$s3 label.color=$s1
fi
