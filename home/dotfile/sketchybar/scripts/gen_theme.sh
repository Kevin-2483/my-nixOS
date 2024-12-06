#!/bin/sh

pic_path=$(osascript -e 'tell application "System Events" to get picture of every desktop')
is_dark_mode=$(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')

echo "壁纸路径: $pic_path"
echo "暗色模式状态: $is_dark_mode"

# 修正条件判断
if [ "$is_dark_mode" = "true" ]; then
    palette="dark16"
else
    palette="light16"
fi

wallust run "$pic_path" --palette "$palette"

sketchybar --reload