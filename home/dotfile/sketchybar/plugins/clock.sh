#!/bin/sh


CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
COLOR_GROUP_FILE="$HOME/.cache/sketchybar/color_group.sh"
source "$CONFIG_FILE"
source "$COLOR_GROUP_FILE"
if [ "$use_local_color" = "true" ]; then
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "false" ]; then
    source "$HOME/.cache/wallust/colors.sh"
fi

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

hour=$(date +%H)
ICON=$(
  if   [ "$hour" == "00" ] || [ "$hour" == "12" ]; then printf "󱑖"
  elif [ "$hour" == "01" ] || [ "$hour" == "13" ]; then printf "󱑋"
  elif [ "$hour" == "02" ] || [ "$hour" == "14" ]; then printf "󱑌"
  elif [ "$hour" == "03" ] || [ "$hour" == "15" ]; then printf "󱑍"
  elif [ "$hour" == "04" ] || [ "$hour" == "16" ]; then printf "󱑎"
  elif [ "$hour" == "05" ] || [ "$hour" == "17" ]; then printf "󱑏"
  elif [ "$hour" == "06" ] || [ "$hour" == "18" ]; then printf "󱑐"
  elif [ "$hour" == "07" ] || [ "$hour" == "19" ]; then printf "󱑑"
  elif [ "$hour" == "08" ] || [ "$hour" == "20" ]; then printf "󱑒"
  elif [ "$hour" == "09" ] || [ "$hour" == "21" ]; then printf "󱑓"
  elif [ "$hour" == "10" ] || [ "$hour" == "22" ]; then printf "󱑔"
  elif [ "$hour" == "11" ] || [ "$hour" == "23" ]; then printf "󱑕"
fi
)

source "$CONFIG_DIR/convert.sh"

if [ "$color_group" = "0" ]; then
  ck1=$color5
else
  ck1=$color13
fi

ck1=$(convert_to_argb "$ck1")

sketchybar --set "$NAME" label="󰸘 $(date '+%d/%m') $ICON $(date '+%H:%M')" label.color=$ck1