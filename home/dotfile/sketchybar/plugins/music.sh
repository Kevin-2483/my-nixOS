#!/bin/bash

# 音乐播放组件插件脚本
# 监控音乐播放状态并更新UI

MUSIC_LOG="$HOME/.cache/sketchybar/music.log"
source $HOME/.config/sketchybar/convert.sh

# 调试日志函数
log_debug() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] MUSIC_PLUGIN: $1" >> "$MUSIC_LOG"
}

log_debug "音乐插件脚本启动 - SENDER: $SENDER, NAME: $NAME"

# 加载颜色配置
CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
COLOR_GROUP_FILE="$HOME/.cache/sketchybar/color_group.sh"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
    log_debug "已加载CONFIG_FILE"
else
    log_debug "CONFIG_FILE不存在: $CONFIG_FILE"
fi

if [ -f "$COLOR_GROUP_FILE" ]; then
    source "$COLOR_GROUP_FILE"
    log_debug "已加载COLOR_GROUP_FILE"
else
    log_debug "COLOR_GROUP_FILE不存在: $COLOR_GROUP_FILE"
fi

if [ "$use_local_color" = "true" ]; then
    if [ -f "$CONFIG_DIR/colors.sh" ]; then
        source "$CONFIG_DIR/colors.sh"
        log_debug "已加载本地颜色配置"
    else
        log_debug "本地颜色配置不存在"
    fi
elif [ "$use_local_color" = "false" ]; then
    if [ -f "$HOME/.cache/wallust/colors.sh" ]; then
        source "$HOME/.cache/wallust/colors.sh"
        log_debug "已加载wallust颜色配置"
    else
        log_debug "wallust颜色配置不存在"
    fi
fi

if [ -f "$CONFIG_DIR/convert.sh" ]; then
    source "$CONFIG_DIR/convert.sh"
    log_debug "已加载convert.sh"
else
    log_debug "convert.sh不存在"
fi

# 设置颜色变量
if [ "$color_group" = "0" ]; then
  MUSIC_ICON_COLOR=$color5
  MUSIC_LABEL_COLOR=$color4
  MUSIC_BG_COLOR=$color2
else
  MUSIC_ICON_COLOR=$color13
  MUSIC_LABEL_COLOR=$color12
  MUSIC_BG_COLOR=$color10
fi

# 转换颜色格式
MUSIC_ICON_COLOR=$(convert_to_argb "$MUSIC_ICON_COLOR")
MUSIC_LABEL_COLOR=$(convert_to_argb "$MUSIC_LABEL_COLOR")
MUSIC_BG_COLOR=$(convert_to_argb "$MUSIC_BG_COLOR")

# 配置参数
ARTWORK_MARGIN=5
BAR_HEIGHT=34

# 创建临时目录
mkdir -p "${TMPDIR}sketchybar"


# 清理之前的进程
pids=$(ps aux | grep 'media-control stream' | grep -v grep | awk '{print $2}')
if [[ -n "$pids" ]]; then
    echo "Killing existing media-control processes: $pids"
    kill -9 $pids 2>/dev/null
fi

# 更新中央分隔符的显示状态
update_separator() {
    local MUSICSTATE=$(sketchybar --query music 2>/dev/null | jq -r '.geometry.drawing' 2>/dev/null || echo "off")
    
    if [ "$MUSICSTATE" = "on" ]; then
        sketchybar --set separator_center drawing=on
    else
        sketchybar --set separator_center drawing=off
    fi
}

# 主要的音乐监控逻辑
if [[ "$SENDER" = "media_change" ]] || [[ "$SENDER" = "forced" ]]; then
    # 启动media-control流监听
    /opt/homebrew/bin/media-control stream 2>/dev/null | grep --line-buffered 'data' | while IFS= read -r line; do
        # log_debug "media-control stream 输出: $line"
        # 检查数据是否有效
        if [[ "$(echo "$line" | jq -r .payload 2>/dev/null)" == '{}' ]] || [[ -z "$line" ]]; then
            # 没有音乐播放，隐藏组件
            sketchybar --set music drawing=off \
                       --set music.title drawing=off \
                       --set music.subtitle drawing=off
            update_separator
            continue
        fi
        
        # 解析音乐信息
        artworkData=$(echo "$line" | jq -r .payload.artworkData 2>/dev/null)
        playing=$(echo "$line" | jq -r .payload.playing 2>/dev/null)
        title=$(echo "$line" | jq -r .payload.title 2>/dev/null)
        artist=$(echo "$line" | jq -r .payload.artist 2>/dev/null)
        album=$(echo "$line" | jq -r .payload.album 2>/dev/null)
        
        # 处理封面图片
        if [[ "$artworkData" != "null" ]] && [[ -n "$artworkData" ]]; then
            tmpfile=$(mktemp "${TMPDIR}sketchybar/cover.XXXXXXXXXX")
            
            # 解码base64图片数据
            echo "$artworkData" | base64 -d > "$tmpfile" 2>/dev/null
            
            if [[ -f "$tmpfile" ]] && [[ -s "$tmpfile" ]]; then
                # 检测图片格式
                case $(file -b --mime-type "$tmpfile" 2>/dev/null) in
                    "image/jpeg") ext="jpg" ;;
                    "image/png") ext="png" ;;
                    "image/tiff") ext="tiff" ;;
                    *) ext="jpg" ;; # 默认为jpg
                esac
                
                mv "$tmpfile" "$tmpfile.$ext"
                
                # 如果是TIFF格式，转换为JPG
                if [[ "$ext" = "tiff" ]] && command -v magick &> /dev/null; then
                    magick "$tmpfile.tiff" "$tmpfile.jpg" 2>/dev/null
                    ext="jpg"
                    rm -f "$tmpfile.tiff"
                fi
                
                # 计算缩放比例和宽度
                if command -v identify &> /dev/null; then
                    height=$(identify -ping -format '%h' "$tmpfile.$ext" 2>/dev/null || echo "24")
                    width=$(identify -ping -format '%w' "$tmpfile.$ext" 2>/dev/null || echo "24")
                    
                    scale=$(echo "scale=4; ($BAR_HEIGHT - $ARTWORK_MARGIN * 2) / $height" | bc -l 2>/dev/null || echo "1")
                    icon_width=$(echo "scale=0; $width * $scale" | bc -l 2>/dev/null || echo "24")
                    
                    sketchybar --set "$NAME" background.image="$tmpfile.$ext" \
                                             background.image.scale="$scale" \
                                             icon.width="$(printf "%.0f" "$icon_width")"
                else
                    # 如果没有identify命令，使用默认设置
                    sketchybar --set "$NAME" background.image="$tmpfile.$ext" \
                                             background.image.scale=1 \
                                             icon.width=24
                fi
                
                # 清理临时文件
                rm -f "$tmpfile"*
            fi
        fi
        
        # 设置标题和艺术家信息
        if [[ "$title" != "null" ]] && [[ -n "$title" ]]; then
            title_label="$title"
            subtitle_label="$artist"
            
            if [[ "$album" != "null" ]] && [[ -n "$album" ]]; then
                subtitle_label="$artist • $album"
            fi
            
            sketchybar --set "$NAME.title" label="$title_label" \
                       --set "$NAME.subtitle" label="$subtitle_label"
        fi
        
        # 设置播放状态图标
        if [[ "$playing" != "null" ]]; then
            case "$playing" in
                "true")
                    sketchybar --set "$NAME" icon.padding_left=-3 \
                                           --animate tanh 5 \
                                           --set "$NAME" icon="􀊆" \
                                                         icon.drawing=on
                    # 5秒后淡出图标
                    {
                        sleep 5
                        sketchybar --animate tanh 45 --set "$NAME" icon.drawing=false
                    } &
                    ;;
                "false")
                    sketchybar --set "$NAME" icon.padding_left=0 \
                                           --animate tanh 5 \
                                           --set "$NAME" icon="􀊄" \
                                                         icon.drawing=on
                    # 5秒后淡出图标
                    {
                        sleep 5
                        sketchybar --animate tanh 45 --set "$NAME" icon.drawing=false
                    } &
                    ;;
            esac
        fi
        
        # 显示音乐组件
        sketchybar --set "$NAME" drawing=on \
                   --set "$NAME.title" drawing=on \
                   --set "$NAME.subtitle" drawing=on
        
        update_separator
        
    done &
    
    # 保存进程ID以便后续清理
    echo $! > "${TMPDIR}sketchybar/music_pid"
fi

# 如果是点击事件，切换播放状态
if [[ "$SENDER" = "mouse.clicked" ]]; then
    /opt/homebrew/bin/media-control toggle-play-pause 2>/dev/null || echo "Failed to toggle play/pause"
fi