{ lib, pkgs, ... }: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    package = pkgs.yabai;
    extraConfig =
      let
        # 导入应用列表
        excludedApps = import ./excluded-apps.nix;
        # 将应用列表拼接成正则表达式
        excludedAppsRegex = lib.concatStringsSep "|" (lib.map (app: "^(${app})") excludedApps);
      in
      ''
        yabai -m config    external_bar                 all:40:0
        yabai -m config    menubar_opacity              1.0
        yabai -m config    window_origin_display        default
        yabai -m config    window_placement             second_child
        yabai -m config    window_zoom_persist          on
        yabai -m config    window_shadow                float
        yabai -m config    window_animation_duration    0.3
        yabai -m config    window_opacity               on
        yabai -m config    window_opacity_duration      0.2
        yabai -m config    active_window_opacity        1.0
        yabai -m config    normal_window_opacity        0.90
        yabai -m config    insert_feedback_color        0xffd75f5f
        yabai -m config    split_ratio                  0.50
        yabai -m config    split_type                   auto
        yabai -m config    auto_balance                 off
        yabai -m config    window_topmost               on
        yabai -m config    top_padding                  20
        yabai -m config    bottom_padding               20
        yabai -m config    left_padding                 20
        yabai -m config    right_padding                20
        yabai -m config    window_gap                   20
        yabai -m config    layout                       bsp
        yabai -m config    mouse_follows_focus          on
        yabai -m config    focus_follows_mouse          autofocus
        yabai -m config    mouse_modifier               alt
        yabai -m config    mouse_action1                move
        yabai -m config    mouse_action2                resize
        yabai -m config    mouse_drop_action            swap

        yabai -m rule --add app="${excludedAppsRegex}" manage=off sticky=on
        yabai -m rule --add app="^(Mihomo Party)$" title =="^(Mihomo Party Floating)$" manage=off sticky=on
        yabai -m rule - -add app="^(Arc)$" title =="^$" manage=off sticky=on
        yabai -m signal --add event=window_created action="sketchybar -m --trigger window_change &> /dev/null"
        yabai -m signal --add event=window_destroyed action="sketchybar -m --trigger window_change &> /dev/null"
        yabai -m signal --add app='^Ghostty$' event=window_created action='yabai -m space --layout bsp'
        yabai -m signal --add app='^Ghostty$' event=window_destroyed action='yabai -m space --layout bsp'

      '';
    # - swap: 交换窗口位置
    # - stack: 堆叠在旧窗口上

    # Override default layout for space 2 only
    #yabai -m config --space 2 layout float
    # 浮动式窗口

    # ------------------------------------------------------------------------------------- #
    # ---------------------------------specific apps--------------------------------------- #
    # ------------------------------------------------------------------------------------- #

    # manage: 是否使用 yabai 管理
    # - on
    # - off
    # sticky: 是否总是置顶
    # - on
    # - off
  };
}
