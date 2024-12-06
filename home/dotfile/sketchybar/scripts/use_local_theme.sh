#!/bin/sh

CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
source "$CONFIG_FILE"
if [ "$use_local_color" = "true" ]; then
    echo "use_local_color=false" > "$CONFIG_FILE"
elif [ "$use_local_color" = "false" ]; then
    echo "use_local_color=true" > "$CONFIG_FILE"
fi

sketchybar --reload