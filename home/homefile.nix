{
  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  home.file.".config/micro" = {
    # source = ~/.config/nix-darwin/home/dotfile/micro;
    source = ./dotfile/micro;
    recursive = true;   # 递归整个文件夹
    executable = true;  # 将其中所有文件添加「执行」权限

  };

  home.file.".config/nvim" = {
    # source = ~/.config/nix-darwin/home/dotfile/nvim;
    source = ./dotfile/nvim;
    recursive = true;   # 递归整个文件夹
    executable = true;  # 将其中所有文件添加「执行」权限

  };

  home.file.".config/yazi" = {
    # source = ~/.config/nix-darwin/home/dotfile/yazi;
    source = ./dotfile/yazi;
    recursive = true;   # 递归整个文件夹
    executable = true;  # 将其中所有文件添加「执行」权限

  };
  home.file.".config/borders" = {
    # source = ~/.config/nix-darwin/home/dotfile/yazi;
    source = ./dotfile/borders;
    recursive = true;   # 递归整个文件夹
    executable = true;  # 将其中所有文件添加「执行」权限

  };
  home.file.".config/sketchybar" = {
    source = ./dotfile/sketchybar;
    recursive = true;
    executable = true;
  };
 home.file.".config/imgs" = {
  source = ./dotfile/imgs;
  recursive = true;
  executable = true;
 };
 home.file.".config/wezterm" = {
  source = ./dotfile/wezterm;
  recursive = true;
  executable = true;
 };
 home.file.".config/mpv" = {
  source = ./dotfile/mpv;
  recursive = true;
  executable = true;
 };
 home.file."Library/Rime" = {
  source = ./dotfile/Rime;
  recursive = true;
  executable = true;
 };
 home.file.".config/zed" = {
  source = ./dotfile/zed;
  recursive = true;
  executable = true;
 };

 home.file."Library/Fonts/adobe_garamond_small_caps.ttf".source = ./dotfile/Fonts/adobe_garamond_small_caps.ttf;
 home.file."Library/Fonts/B2Hana-Medium.ttf".source = ./dotfile/Fonts/B2Hana-Medium.ttf;
 home.file."Library/Fonts/B2Hana-Regular-Lite.ttf".source = ./dotfile/Fonts/B2Hana-Regular-Lite.ttf;
 home.file."Library/Fonts/B2Hana-Regular.ttf".source = ./dotfile/Fonts/B2Hana-Regular.ttf;
 home.file."Library/Fonts/B2HanaB-Medium.ttf".source = ./dotfile/Fonts/B2HanaB-Medium.ttf;
 home.file."Library/Fonts/B2HanaB-Regular.ttf".source = ./dotfile/Fonts/B2HanaB-Regular.ttf;
 home.file."Library/Fonts/HanaMinA.ttf".source = ./dotfile/Fonts/HanaMinA.ttf;
 home.file."Library/Fonts/HanaMinB.ttf".source = ./dotfile/Fonts/HanaMinB.ttf;
 home.file."Library/Fonts/sarasa-term-sc-nerd.ttc".source = ./dotfile/Fonts/sarasa-term-sc-nerd.ttc;

  # home.file.".config/skhd" = {
  #   # source = ~/.config/nix-darwin/home/dotfile/yazi;
  #   source = ./dotfile/skhd;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };
  # home.file.".config/yabai" = {
  # 	source = ./dotfile/yabai;
  # 	recursive = true;
  # 	executable = true;
  # };
  # 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;

  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装


}
