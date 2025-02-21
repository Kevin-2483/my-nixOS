#!/bin/bash

# source "$CONFIG_DIR/colors.sh"

# if [ "$SENDER" = "media_change" ]; then
  MEDIAINFO="$(nowplaying-cli get-raw)" 
  IS_PLAYING=$(echo "$MEDIAINFO" | grep -oE 'kMRMediaRemoteNowPlayingInfoPlaybackRate = [0-9.]+' | sed 's/.*= //')

  # 如果 IS_PLAYING 存在且不为 0，则表示正在播放
  if [ -n "$IS_PLAYING" ] && [ "$IS_PLAYING" != "0" ]; then
    ICON=""  # 暂停图标
  else
    ICON=""  # 播放图标
  fi

  sketchybar --set "$NAME" icon="${ICON}" icon.color=$color0 icon.padding_right=12 \
              label="${LABEL}" label.color=$color0 label.padding_right=12 \
              background.color=$YELLOW background.corner_radius=15 \
              background.height=24 background.padding_left=10
# fi
