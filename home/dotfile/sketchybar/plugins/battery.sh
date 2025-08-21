#!/bin/sh

# 数字转中文大写汉字函数
convert_to_chinese() {
    local num="$1"
    local result=""
    
    # 特殊处理：100显示为MAX
    if [ "$num" = "100" ]; then
        echo "󰬔 󰬈 󰬟"
        return
    fi
    
    # 补齐到三位数（一位数前面补零零，两位数前面补零）
    if [ ${#num} -eq 1 ]; then
        num="0$num"
    elif [ ${#num} -eq 2 ]; then
        num="$num"
    fi
    
    # 处理每一位数字
    while [ ${#num} -gt 0 ]; do
        digit=${num:0:1}
        case $digit in
            0) result="${result}󰎡 " ;;
            1) result="${result}󰎤 " ;;
            2) result="${result}󰎧 " ;;
            3) result="${result}󰎪 " ;;
            4) result="${result}󰎭 " ;;
            5) result="${result}󰎱 " ;;
            6) result="${result}󰎳 " ;;
            7) result="${result}󰎶 " ;;
            8) result="${result}󰎹 " ;;
            9) result="${result}󰎼 " ;;
        esac
        num=${num:1}
    done
    
    echo "$result"
}

CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
COLOR_GROUP_FILE="$HOME/.cache/sketchybar/color_group.sh"
source "$CONFIG_FILE"
source "$COLOR_GROUP_FILE"
if [ "$use_local_color" = "true" ]; then
    source "$CONFIG_DIR/colors.sh"
elif [ "$use_local_color" = "false" ]; then
    source "$HOME/.cache/wallust/colors.sh"
fi

source "$CONFIG_DIR/convert.sh"

# if [ "$SENDER" = "battery" ] || [ "$SENDER" = "system_woke" ] || [ "$SENDER" = "power_source_change" ]; then

  PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
  CHARGING="$(pmset -g batt | grep 'charg' | awk '{print $4}' | tr -d ';')"

  if [ "$PERCENTAGE" = "" ]; then
    exit 0
  fi

if [ "$color_group" = "0" ]; then
  b0=$color1
  b1=$color8
  b2=$color7
  b3=$color6
else
  b0=$color9
  b1=$color16
  b2=$color15
  b3=$color14
fi

  # 根据 PERCENTAGE 设置 BGCOLOR
  if [ "$PERCENTAGE" -gt 50 ]; then
      BGCOLOR=$b1
  elif [ "$PERCENTAGE" -ge 20 ]; then
      BGCOLOR=$b2
  else
      BGCOLOR=$b3
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
    LAST_DIGIT_ICON=" 󱊣"
  elif [ $LAST_DIGIT -ge 10 ]; then 
    LAST_DIGIT_ICON=" 󱊢"
  elif [ $LAST_DIGIT -ge 5 ]; then 
    LAST_DIGIT_ICON=" 󱊡"
  else 
    LAST_DIGIT_ICON=" 󰂎"
  fi

  MISSING_ICONS=$((4 - COUNT))  # 需要补充的󱉞数量

  # 构建充电状态图标
  if [ "$CHARGING" = "charging" ]; then
    ICON="󱒀 󱐋"
  elif [ "$CHARGING" = "charged" ]; then
    ICON="󱒀 󱟢"
  else 
    ICON="󰥜 󱟤"
  fi

  # 构建电池格子显示
  BATTERY_BARS=$(
    # 当 COUNT 大于 0 时才显示󱊣
    if [ "$COUNT" -gt 0 ]; then
      printf ' 󱊣%.0s' $(seq 1 $COUNT )  # 根据COUNT重复󱊣
    fi
    echo "$LAST_DIGIT_ICON"       # 加上个位数对应的图标
    # 补充剩余的󱉞
    if [ "$MISSING_ICONS" -gt 0 ]; then
      printf ' 󱉞%.0s' $(seq 1 $MISSING_ICONS)
    fi
  )
  
  # 转换百分比为中文数字
  CHINESE_PERCENTAGE=$(convert_to_chinese "$PERCENTAGE")
  
  # 构建完整的label：中文百分比 + 电池格子（电池格子通过滚动显示）
  LABEL="${CHINESE_PERCENTAGE} ${BATTERY_BARS}"
  
  BAR_COLOR=$(convert_to_argb "$b0")
  BGCOLOR=$(convert_to_argb "$BGCOLOR")

  # 更新sketchybar的图标和标签
  sketchybar --set "$NAME" icon="${ICON}" icon.color=$BAR_COLOR label="${LABEL}" label.color=$BAR_COLOR icon.padding_left=4 label.font="Mononoki Nerd Font:Bold:16.0" label.padding_right=4 background.color=$BGCOLOR background.corner_radius=5 background.height=24 background.padding_left=5
# fi
