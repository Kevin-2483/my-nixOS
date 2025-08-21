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

# 获取农历信息
get_lunar_date() {
    if command -v /opt/homebrew/bin/lunar >/dev/null 2>&1; then
        # 提取农历信息并格式化为传统中文格式
        lunar_raw=$(/opt/homebrew/bin/lunar | awk 'NR==4 {print $4, $5}')
        
        # 解析年月日
        lunar_date=$(echo "$lunar_raw" | sed 's/2025-//' | cut -d' ' -f1)
        is_leap=$(echo "$lunar_raw" | grep -o '(闰月)' || echo "")
        
        month=$(echo "$lunar_date" | cut -d'-' -f1)
        day=$(echo "$lunar_date" | cut -d'-' -f2)
        
        # 转换月份
        case $month in
            01) month_cn="一月" ;;
            02) month_cn="二月" ;;
            03) month_cn="三月" ;;
            04) month_cn="四月" ;;
            05) month_cn="五月" ;;
            06) month_cn="六月" ;;
            07) month_cn="七月" ;;
            08) month_cn="八月" ;;
            09) month_cn="九月" ;;
            10) month_cn="十月" ;;
            11) month_cn="十一月" ;;
            12) month_cn="十二月" ;;
        esac
        
        # 转换日期
        case $day in
            01) day_cn="初一" ;;
            02) day_cn="初二" ;;
            03) day_cn="初三" ;;
            04) day_cn="初四" ;;
            05) day_cn="初五" ;;
            06) day_cn="初六" ;;
            07) day_cn="初七" ;;
            08) day_cn="初八" ;;
            09) day_cn="初九" ;;
            10) day_cn="初十" ;;
            11) day_cn="十一" ;;
            12) day_cn="十二" ;;
            13) day_cn="十三" ;;
            14) day_cn="十四" ;;
            15) day_cn="十五" ;;
            16) day_cn="十六" ;;
            17) day_cn="十七" ;;
            18) day_cn="十八" ;;
            19) day_cn="十九" ;;
            20) day_cn="二十" ;;
            21) day_cn="廿一" ;;
            22) day_cn="廿二" ;;
            23) day_cn="廿三" ;;
            24) day_cn="廿四" ;;
            25) day_cn="廿五" ;;
            26) day_cn="廿六" ;;
            27) day_cn="廿七" ;;
            28) day_cn="廿八" ;;
            29) day_cn="廿九" ;;
            30) day_cn="三十" ;;
        esac
        
        # 组合结果
        if [ -n "$is_leap" ]; then
            echo "闰${month_cn}${day_cn}|$day"
        else
            echo "${month_cn}${day_cn}|$day"
        fi
    else
        echo ""
    fi
}

get_moon_phase() {
    local day=$1
    case $day in
        01) echo "" ;; # e38d 晦月 → 这里当作初一，新月/晦月
        02) echo "" ;; # e3d6
        03) echo "" ;; # e3d7
        04) echo "" ;; # e3d8
        05) echo "" ;; # e3d9
        06) echo "" ;; # e3da
        07) echo "" ;; # e3db
        08) echo "" ;; # e3dc 上弦
        09) echo "" ;; # e3dd 上弦偏盈
        10) echo "" ;; # e3de
        11) echo "" ;; # e3df
        12) echo "" ;; # e3e0
        13) echo "" ;; # e3e1 盈月未满
        14) echo "" ;; # e3e2 盈月未满
        15) echo "󰽢" ;; # f0f62 满月 (关键
        16) echo "󰽢" ;; # f0f62 满月 (关键
        17) echo "" ;; # e3c8 望月之后
        18) echo "" ;; # e3c9
        19) echo "" ;; # e3ca
        20) echo "" ;; # e3cb
        21) echo "" ;; # e3cc
        22) echo "" ;; # e3cd 下弦前
        23) echo "" ;; # e3ce 下弦 (关键
        24) echo "" ;; # e3cf 下弦之后
        25) echo "" ;; # e3d0
        26) echo "" ;; # e3d1
        27) echo "" ;; # e3d2
        28) echo "" ;; # e3d3
        29) echo "" ;; # e3d4 晦月之前
        30) echo "" ;; # e38d 晦月
        *)  echo "月" ;;
    esac
}



hour=$(date +%H)
lunar_info=$(get_lunar_date)
lunar_date=$(echo "$lunar_info" | cut -d'|' -f1)
lunar_day=$(echo "$lunar_info" | cut -d'|' -f2)
moon_phase=$(get_moon_phase "$lunar_day")
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

sketchybar --set moon icon=$moon_phase

sketchybar --set calendar label="$(date '+%d/%m/%Y')"

sketchybar --set lunar label=$lunar_date

sketchybar --set clock icon=$ICON label=$(date '+%H:%M')
