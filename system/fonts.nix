
{ config, pkgs, inputs, ... }:

{
# 字体配置
fonts = {
  fontconfig.enable = false;
  fontDir.enable = true;
  enableGhostscriptFonts = true;
  packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    wqy_microhei
    wqy_zenhei
  ];
};
  
}
