#!/bin/sh

source "$CONFIG_DIR/colors.sh"

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO" label.color=$BLUE icon="$($CONFIG_DIR/plugins/icon_map.sh "$INFO")" icon.color=$BLUE label.padding_right=100
fi
