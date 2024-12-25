{ pkgs, ... }:
{
  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  home.file.".config/micro" = {
    # source = ~/.config/nix-darwin/home/dotfile/micro;
    source = ./dotfile/micro;
    recursive = true; # 递归整个文件夹
    executable = true; # 将其中所有文件添加「执行」权限

  };

  home.file.".config/nvim" = {
    # source = ~/.config/nix-darwin/home/dotfile/nvim;
    source = ./dotfile/nvim;
    recursive = true; # 递归整个文件夹
    executable = true; # 将其中所有文件添加「执行」权限

  };

  home.file.".config/yazi" = {
    # source = ~/.config/nix-darwin/home/dotfile/yazi;
    source = ./dotfile/yazi;
    recursive = true; # 递归整个文件夹
    executable = true; # 将其中所有文件添加「执行」权限

  };
  home.file.".config/borders" = {
    # source = ~/.config/nix-darwin/home/dotfile/yazi;
    source = ./dotfile/borders;
    recursive = true; # 递归整个文件夹
    executable = true; # 将其中所有文件添加「执行」权限

  };
  home.file.".config/sketchybar" = {
    source = ./dotfile/sketchybar;
    recursive = true;
    executable = true;
  };
  home.file.".config/sketchybar/excluded-apps.nix" = {
    source = ../system/services/yabai/excluded-apps.nix;
    recursive = true;
    executable = true;
  };
  home.file.".config/imgs" = {
    source = ./dotfile/imgs;
    recursive = true;
    executable = true;
  };
  home.file.".config/rio" = {
    source = ./dotfile/rio;
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
  home.file.".config/lvim" = {
    source = ./dotfile/lvim;
    recursive = true;
    executable = true;
  };
  home.file.".config/sketchybar/sub_bar".source = "${pkgs.sketchybar}/bin/sketchybar";

  home.file."Library/Application Support/wallust" = {
    source = ./dotfile/wallust;
    recursive = true;
    executable = true;
  };


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
