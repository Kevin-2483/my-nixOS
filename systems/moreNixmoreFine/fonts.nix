{ config, pkgs, inputs, ... }:
{
  # 字体配置
  fonts = {
    fontconfig.enable = false;
    fontDir.enable = false;
    enableGhostscriptFonts = false;
    packages = with pkgs; [

    ];
  };

}
