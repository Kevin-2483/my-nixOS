#!/bin/bash

source "$CONFIG_DIR/colors.sh"

SPACE_ICONS=("壹" "貳" "叁" "肆" "伍" "陸" "柒" "捌" "玖" "拾")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  space=(
    space=$sid
    icon=${SPACE_ICONS[i]}                                  
    icon.highlight_color=$RED
    icon.padding_left=10
    label.font="sketchybar-app-font:Regular:16.0" 
    label.padding_right=20                     
    label.y_offset=-1                          
    script="$PLUGIN_DIR/space.sh"
  )
  sketchybar --add space space.$sid left                                 \
             --set space.$sid "${space[@]}"
done

sketchybar --add item space_separator left                             \
           --set space_separator icon=                                \
                                 icon.color=$BLUE                 \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change                           
