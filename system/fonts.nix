
{ config, pkgs, inputs, ... }:

{
# 字体配置
fonts = {
  fontconfig.enable = true;
  fontDir.enable = true;
  enableGhostscriptFonts = true;
  packages = with pkgs; [
  (nerdfonts.override{ fonts = [
  	"Ubuntu"
  	"UbuntuMono"
  	"SpaceMono"
  	"CascadiaCode"
  	"ComicShannsMono"
  	"FantasqueSansMono"
  	"FiraCode"
  	"Mononoki"
  	
  ]; })
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    wqy_microhei
    wqy_zenhei
  ];
};
  
}
