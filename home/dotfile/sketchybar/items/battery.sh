#!/bin/bash
sketchybar --add item battery right \
           --set battery update_freq=8 script="$PLUGIN_DIR/battery.sh" \
                        scroll_texts=on \
                        label.max_chars=5 \
                        label.scroll_duration=60 \
           --subscribe battery system_woke power_source_change

