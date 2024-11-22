#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# 使用 nix 读取 excluded-apps.nix 文件并将其转换为 Bash 数组
skip_apps=($(nix-instantiate --eval --strict --json -E "import $CONFIG_DIR/excluded-apps.nix" | jq -r '.[]'))

# echo "${skip_apps[0]}" >> "$CONFIG_DIR/debug.log"
# 将 nix-instantiate 输出写入日志文件
# nix_output=$(nix-instantiate --eval --strict -E "import $CONFIG_DIR/excluded-apps.nix")
# echo "nix-instantiate 输出: $nix_output" >> "$CONFIG_DIR/debug.log"


if [ "$SENDER" = "space_windows_change" ]; then
  space="$(echo "$INFO" | jq -r '.space')"
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

  icon_strip=" "
  
  if [ -n "$apps" ]; then
    all_skipped=true  # 假设所有应用都被跳过
    while read -r app; do
      # 检查是否在跳过列表中
      if printf "%s\n" "${skip_apps[@]}" | grep -Fxq "$app"; then
        continue  # 如果是跳过的应用，则跳过此循环
      else
        all_skipped=false  # 如果有应用没有被跳过
      fi
      # 渲染图标
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    done <<< "${apps}"

    # 如果所有应用都被跳过，则输出 󱁐
    if [ "$all_skipped" = true ]; then
      icon_strip=" 󱁐"
    fi
  else
    icon_strip=" 󱁐"
  fi

  # 更新 sketchybar
  sketchybar --set space.$space label="$icon_strip"
fi