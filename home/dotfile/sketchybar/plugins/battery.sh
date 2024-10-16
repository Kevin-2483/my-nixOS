#!/bin/sh

source "$CONFIG_DIR/colors.sh"

# if [ "$SENDER" = "battery" ] || [ "$SENDER" = "system_woke" ] || [ "$SENDER" = "power_source_change" ]; then

  PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
  CHARGING="$(pmset -g batt | grep 'charg' | awk '{print $4}' | tr -d ';')"

  if [ "$PERCENTAGE" = "" ]; then
    exit 0
  fi


  # 计算应该显示几个󱊣，最多显示4个
  COUNT=$((PERCENTAGE / 20))  # 计算基础值

  # 如果音量恰好是 20, 40, 60, 80 或 100，COUNT 应该减去 1
  if [ $((PERCENTAGE % 20)) -eq 0 ] && [ "$PERCENTAGE" -ne 0 ]; then
    COUNT=$((COUNT - 1))
  fi

  # 根据个位数确定的图标
  LAST_DIGIT=$(( PERCENTAGE - ( COUNT * 20 ) ))
  if [ $LAST_DIGIT -ge 15 ]; then 
    LAST_DIGIT_ICON=" 󱊣"
  elif [ $LAST_DIGIT -ge 10 ]; then 
    LAST_DIGIT_ICON=" 󱊢"
  elif [ $LAST_DIGIT -ge 5 ]; then 
    LAST_DIGIT_ICON=" 󱊡"
  else 
    LAST_DIGIT_ICON=" 󰂎"
  fi

  MISSING_ICONS=$((4 - COUNT))  # 需要补充的󱉞数量

  # 构建图标字符串
  ICON=$(
    if [ "$CHARGING" = "charging" ]; then
      echo "󱒀 󱐋"
    elif [ "$CHARGING" = "charged" ]; then
      echo "󱒀 󱟢"
    else 
      echo "󰥜 󱟤"
    fi
    # 当 COUNT 大于 0 时才显示󱊣
    if [ "$COUNT" -gt 0 ]; then
      printf ' 󱊣%.0s' $(seq 1 $COUNT )  # 根据COUNT重复󱊣
    fi
    echo "$LAST_DIGIT_ICON"       # 加上个位数对应的图标
    # 补充剩余的󱉞
    if [ "$MISSING_ICONS" -gt 0 ]; then
      printf ' 󱉞%.0s' $(seq 1 $MISSING_ICONS)
    fi
  )

  # 更新sketchybar的图标和标签
  sketchybar --set "$NAME" label="${ICON}" label.color=$BAR_COLOR label.padding_right=12 background.color=$YELLOW background.corner_radius=15 background.height=24 background.padding_left=10
# fi
