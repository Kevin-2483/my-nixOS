#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'charg' | awk '{print $4}' | tr -d ';')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

if [ "$CHARGING" == "charging" ] || [ "$CHARGING" == "charged" ]; then ICON = "󰂄"
elif [ $PERCENTAGE -ge 75 ]; then ICON = "󱊣"
elif [ $PERCENTAGE -ge 50 ]; then ICON = "󱊢"
elif [ $PERCENTAGE -ge 25 ]; then ICON = "󱊡"
elif [ $PERCENTAGE -ge 0  ]; then ICON = "󰂎"
fi


# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
