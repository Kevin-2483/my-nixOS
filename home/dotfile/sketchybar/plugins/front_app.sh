#!/bin/sh

CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
source "$CONFIG_FILE"
if [ -z "${use_local_color+x}" ]; then
    export use_local_color=true
    echo "use_local_color=true" > "$CONFIG_FILE"
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "true" ]; then
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "false" ]; then
    source "$HOME/.cache/wallust/colors.sh"
fi

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

source "$CONFIG_DIR/convert.sh"

f1=$color5

f1=$(convert_to_argb "$f1")

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO" label.color=$f1 icon="$($CONFIG_DIR/plugins/icon_map.sh "$INFO")" icon.color=$f1 label.padding_right=100
fi
