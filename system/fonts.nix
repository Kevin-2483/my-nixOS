
{ config, pkgs, inputs, ... }:

{
# 字体配置
fonts = {
  fontconfig.enable = true;
  fontDir.enable = true;
  enableGhostscriptFonts = true;
  packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "ComicShannsMono" "UbuntuMono" "SpaceMono" ]; })
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    wqy_microhei
    wqy_zenhei
  ];
};
  
}
