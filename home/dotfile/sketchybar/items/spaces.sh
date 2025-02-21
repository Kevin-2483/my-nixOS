#!/bin/bash

# source "$CONFIG_DIR/colors.sh"

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



sketchybar --add item spacelabel left                                           \
           --set spacelabel label="" icon=" " icon.color=$s3 label.color=$s1  \
                 click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
                 popup.background.border_width=2                                \
                 popup.background.corner_radius=20                              \
                 popup.background.border_color=$s3                              \
                 popup.background.color=$s0                                     \
                 popup.background.drawing=on                                    \
                 popup.y_offset=6                                               \
            --add item spacelabel.use_local_color popup.spacelabel              \
            --set spacelabel.use_local_color label="使用生成的配色  " icon="󰁨 " icon.color=$s0 label.color=$s0  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="$SCRIPT_DIR/use_local_theme.sh" \
                  background.drawing=on \
                  background.corner_radius=15 \
                  background.color=$s3 \
            --add item spacelabel.color_group popup.spacelabel                  \
            --set spacelabel.color_group label="切换颜色组  " icon=" " icon.color=$s3 label.color=$s1  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="$SCRIPT_DIR/switch_color_group.sh" \
            --add item spacelabel.reload popup.spacelabel                       \
            --set spacelabel.reload label="刷新  " icon=" " icon.color=$s3 label.color=$s1  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="sketchybar --reload" \
            --add item spacelabel.gen_theme popup.spacelabel             \
            --set spacelabel.gen_theme label="生成主题  " icon="󰽉 " icon.color=$s3 label.color=$s1  \
                  label.padding_right=10 \
                  icon.padding_left=10 \
                  click_script="$SCRIPT_DIR/gen_theme.sh"

if [ "$use_local_color" = "true" ]; then
    sketchybar --set spacelabel.use_local_color background.drawing=off icon.color=$s3 label.color=$s1
fi


SPACE_ICONS=("壹" "貳" "叁" "肆" "伍" "陸" "柒" "捌" "玖" "拾")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  space=(
    space=$sid
    icon=${SPACE_ICONS[i]}                                  
    icon.highlight_color=$s2
    icon.padding_left=10
    label.font="sketchybar-app-font:Regular:16.0" 
    label.padding_right=20                     
    label.y_offset=-1                          
    script="$PLUGIN_DIR/space.sh"
    click_script="yabai -m space --focus $sid"
  )
  sketchybar --add space space.$sid left                                 \
             --set space.$sid "${space[@]}"
done

sketchybar --add item space_separator left                           \
           --set space_separator icon=" "                               \
                                 icon.color=$s1                 \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change                           
