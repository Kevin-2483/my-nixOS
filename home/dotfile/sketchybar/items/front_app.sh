#!/bin/bash

front_app=(
  icon.font="sketchybar-app-font:Regular:16.0"
  label.font="UbuntuMono Nerd Font:Bold:16.0"
  script="$PLUGIN_DIR/front_app.sh"
  padding_left=0
  padding_right=0
)

sketchybar --add item front_app e \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched

