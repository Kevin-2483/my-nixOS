{ lib, pkgs, ... }:
{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    package = pkgs.yabai;
    extraConfig = ''
      yabai -m config    external_bar                 all:40:0       #將自訂欄與 yabai 提供的填滿功能（特別是： space --toggle padding ）整合
      yabai -m config    menubar_opacity              1.0            #完全停用上方系统功能表列
      yabai -m config    window_origin_display        default
      yabai -m config    window_placement             second_child   #second_child 为新窗口在当前窗口的右侧或下方生成 first_child 为新窗口在当前窗口的左侧或上方生成
      yabai -m config    window_zoom_persist          on             #on 为窗口最大化后再次点击窗口标题栏恢复原始大小 off 为窗口最大化后再次点击窗口标题栏不恢复原始大小
      yabai -m config    window_shadow                float           #float 为浮动窗口显示阴影 off 为不显示阴影 on 为显示阴影
      yabai -m config    window_animation_duration    0.3            #动画持续时间
      yabai -m config    window_opacity               on             #窗口透明度开关
      yabai -m config    window_opacity_duration      0.2            #窗口透明度变化时间
      yabai -m config    active_window_opacity        1.0            #活动窗口透明度
      yabai -m config    normal_window_opacity        0.90           #非活动窗口透明度
      yabai -m config    insert_feedback_color        0xffd75f5f     #
      yabai -m config    split_ratio                  0.50           #分流比
      yabai -m config    split_type                   auto           #auto 为自动分割，vertical 为垂直分割，horizontal 为水平分割
      yabai -m config    auto_balance                 off            #自動平衡使得所有視窗始終佔據相同的空間，無論它們在視窗樹中嵌套的深度如何。當插入新視窗或刪除視窗時，分割比例將自動調整。
      yabai -m config    window_topmost               on                # 浮动窗口是否置顶
      yabai -m config    top_padding                  20             # 窗口和屏幕边缘的距离（优先级低于 gap）
      yabai -m config    bottom_padding               20
      yabai -m config    left_padding                 20
      yabai -m config    right_padding                20
      yabai -m config    window_gap                   20             # 窗口与窗口之间的间距（优先级高于 padding
      yabai -m config    layout                       bsp            #bsp 为二叉分割布局 float 为浮动布局 stack: 堆叠
      yabai -m config    mouse_follows_focus          on             #on 为鼠标跟随焦点 off 为鼠标不跟随焦点
      yabai -m config    focus_follows_mouse          autofocus      #autofocus 为焦点跟随鼠标 autoraise 为焦点跟随鼠标并且自动提升窗口
      yabai -m config    mouse_modifier                alt            #鼠标操作的修饰键
      yabai -m config    mouse_action1                move           #左键拖动窗口
      yabai -m config    mouse_action2                resize         #右键调整大小
      yabai -m config    mouse_drop_action            swap           ## 在平铺管理情况下，拖动一个窗口到另一窗口位置时的操作


      yabai -m rule --add app="^(系統設定|Finder|LocalSend|計算機|Motrix|wezterm-gui|活動監視器|語音備忘錄|預覽程式|天氣|QuickTime Player|Shottr|dragon)$" manage=off sticky=on
      yabai -m rule --add app="^(Mihomo Party)$" title =="^(Mihomo Party Floating)$" manage=off sticky=on
      yabai -m signal --add event=window_created action="sketchybar -m --trigger window_change &> /dev/null"
      yabai -m signal --add event=window_destroyed action="sketchybar -m --trigger window_change &> /dev/null"
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
