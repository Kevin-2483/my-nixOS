#!/bin/sh

source "$CONFIG_DIR/colors.sh"
# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
  COUNT=$((VOLUME / 20))  # 根据音量百分比计算音符的数量

  # 如果音量恰好是 20, 40, 60, 80 或 100，COUNT 应该减去 1
if [ $((VOLUME % 20)) -eq 0 ] && [ "$VOLUME" -ne 0 ]; then
  COUNT=$((COUNT - 1))
fi

  # 计算最后一个图标的显示
  if [ "$VOLUME" -eq 0 ]; then
    LAST_DIGIT_ICON="󰝛"
  else
    LAST_DIGIT=$(( VOLUME - (COUNT * 20) ))
    if [ "$LAST_DIGIT" -ge 10 ]; then
      LAST_DIGIT_ICON=""
      else
      LAST_DIGIT_ICON="󰎇"
    fi
  fi

  # 构建图标字符串
if [ "$COUNT" -gt 0 ]; then
    ICON=$(printf '  %.0s' $(seq 1 "$COUNT"))  # 根据COUNT重复音符图标
  else
    ICON=""  # 如果COUNT为0，则没有图标
  fi
  ICON="${ICON}${LAST_DIGIT_ICON}"  # 加上个位数对应的图标

  sketchybar --set "$NAME" label="$ICON" label.color=$BAR_COLOR label.padding_right=12 background.color=$GREEN background.corner_radius=15 background.height=24
fi