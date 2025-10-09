{ config, pkgs, inputs, ... }:
{
  # 字体配置
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [

    ];
  };

}
