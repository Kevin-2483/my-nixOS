#!/bin/bash
sketchybar --add item nowplay right \
           --set nowplay update_freq=1 script="$PLUGIN_DIR/nowplay.sh" \
           --subscribe nowplay media_change

