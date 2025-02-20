{ config, pkgs, inputs, ... }:

{
  # 字体配置
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      wqy_microhei
      wqy_zenhei
      sketchybar-app-font
    ];
  };
}
