#!/bin/bash

# 音乐播放组件配置
# 基于nix版本改编，去除menubar-cli依赖

# 调试日志函数
log_debug() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] MUSIC_ITEM: $1" >> "$MUSIC_LOG"
}

log_debug "开始加载音乐组件配置"

# 加载颜色配置
CONFIG_FILE="$HOME/.cache/sketchybar/config.sh"
COLOR_GROUP_FILE="$HOME/.cache/sketchybar/color_group.sh"

log_debug "CONFIG_FILE: $CONFIG_FILE"
log_debug "COLOR_GROUP_FILE: $COLOR_GROUP_FILE"
log_debug "CONFIG_DIR: $CONFIG_DIR"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
    log_debug "已加载 CONFIG_FILE"
else
    log_debug "CONFIG_FILE 不存在"
fi

if [ -f "$COLOR_GROUP_FILE" ]; then
    source "$COLOR_GROUP_FILE"
    log_debug "已加载 COLOR_GROUP_FILE"
else
    log_debug "COLOR_GROUP_FILE 不存在"
fi

log_debug "use_local_color: $use_local_color"
log_debug "color_group: $color_group"

if [ "$use_local_color" = "true" ]; then
    if [ -f "$CONFIG_DIR/colors.sh" ]; then
        source "$CONFIG_DIR/colors.sh"
        log_debug "已加载本地颜色配置"
    else
        log_debug "本地颜色配置文件不存在: $CONFIG_DIR/colors.sh"
    fi
elif [ "$use_local_color" = "false" ]; then
    if [ -f "$HOME/.cache/wallust/colors.sh" ]; then
        source "$HOME/.cache/wallust/colors.sh"
        log_debug "已加载wallust颜色配置"
    else
        log_debug "wallust颜色配置文件不存在"
    fi
fi

if [ -f "$CONFIG_DIR/convert.sh" ]; then
    source "$CONFIG_DIR/convert.sh"
    log_debug "已加载convert.sh"
else
    log_debug "convert.sh不存在: $CONFIG_DIR/convert.sh"
fi

# 获取颜色配置
log_debug "原始颜色变量 - color4: $color4, color5: $color5, color12: $color12, color13: $color13"

if [ "$color_group" = "0" ]; then
  MUSIC_ICON_COLOR=$color5
  MUSIC_LABEL_COLOR=$color4
  MUSIC_BG_COLOR=$color2
  MUSIC_BORDER_COLOR=$color4
  log_debug "使用颜色组0"
else
  MUSIC_ICON_COLOR=$color13
  MUSIC_LABEL_COLOR=$color12
  MUSIC_BG_COLOR=$color10
  MUSIC_BORDER_COLOR=$color12
  log_debug "使用颜色组1"
fi

log_debug "转换前颜色 - ICON: $MUSIC_ICON_COLOR, LABEL: $MUSIC_LABEL_COLOR"

# 转换颜色格式
if command -v convert_to_argb &> /dev/null; then
    MUSIC_ICON_COLOR=$(convert_to_argb "$MUSIC_ICON_COLOR")
    MUSIC_LABEL_COLOR=$(convert_to_argb "$MUSIC_LABEL_COLOR")
    MUSIC_BG_COLOR=$(convert_to_argb "$MUSIC_BG_COLOR")
    MUSIC_BORDER_COLOR=$(convert_to_argb "$MUSIC_BORDER_COLOR")
    log_debug "颜色转换成功"
else
    log_debug "convert_to_argb函数不可用"
fi

log_debug "最终颜色 - ICON: $MUSIC_ICON_COLOR, LABEL: $MUSIC_LABEL_COLOR"

# 音乐组件配置参数
ARTWORK_MARGIN=5
TITLE_MARGIN=11
INFO_WIDTH=80
BAR_HEIGHT=34

# 音乐封面组件
music_artwork=(
  drawing=off
  script="$PLUGIN_DIR/music.sh"
  click_script="media-control toggle-play-pause 2>/dev/null || echo 'media-control not found'"
  icon="􀊆"
  icon.drawing=off
  icon.color=$MUSIC_ICON_COLOR
  icon.shadow.drawing=on
  icon.shadow.color=$BAR_COLOR
  icon.shadow.distance=3
  icon.align=center
  label.drawing=off
  icon.padding_right=0
  icon.padding_left=-3
  background.drawing=on
  background.height=$((BAR_HEIGHT - ARTWORK_MARGIN * 2))
  background.image.border_color=$MUSIC_BORDER_COLOR
  background.image.border_width=1
  background.image.corner_radius=4
  background.image.padding_right=1
  update_freq=0
  padding_left=0
  padding_right=8
)

# 音乐标题组件
music_title=(
  label="Title"
  drawing=off
  label.color=$MUSIC_LABEL_COLOR
  icon.drawing=off
  label.align=right
  label.width=$INFO_WIDTH
  label.max_chars=13
  label.font="B2花園:Medium:10.0"
  scroll_texts=on
  padding_left=-$INFO_WIDTH
  padding_right=0
  y_offset=$((BAR_HEIGHT / 2 - TITLE_MARGIN))
)

# 音乐副标题组件（艺术家和专辑）
music_subtitle=(
  label="SubTitle"
  drawing=off
  label.color=$MUSIC_ICON_COLOR
  icon.drawing=off
  label.align=right
  label.width=$INFO_WIDTH
  label.max_chars=14
  label.font="B2花園:Medium:9.0"
  scroll_texts=on
  padding_left=0
  padding_right=0
  y_offset=$((-BAR_HEIGHT / 2 + TITLE_MARGIN))
)

# 中央分隔符
center_separator=(
  icon="-"
  script="$PLUGIN_DIR/music.sh"
  icon.color=$MUSIC_ICON_COLOR
  icon.font="UbuntuMono Nerd Font:Bold:16.0"
  icon.y_offset=2
  label.drawing=off
  icon.padding_left=0
  icon.padding_right=0
  update_freq=0
  updates=on
)

# 添加组件到SketchyBar
log_debug "开始添加音乐组件到SketchyBar"

log_debug "添加中央分隔符"
sketchybar --add item separator_center center \
           --set separator_center "${center_separator[@]}" \
           --add event media_change

sketchybar --subscribe separator_center media_change
log_debug "中央分隔符添加完成"

log_debug "添加音乐组件 - music"
sketchybar --add item music right \
           --set music "${music_artwork[@]}"
log_debug "音乐封面组件添加完成"

log_debug "添加音乐标题组件 - music.title"
sketchybar --add item music.title right \
           --set music.title "${music_title[@]}"
log_debug "音乐标题组件添加完成"

log_debug "添加音乐副标题组件 - music.subtitle"
sketchybar --add item music.subtitle right \
           --set music.subtitle "${music_subtitle[@]}"
log_debug "音乐副标题组件添加完成"

log_debug "音乐组件配置完成"