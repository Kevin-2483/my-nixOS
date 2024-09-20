{ pkgs, ... }:
{
  system.activationScripts.fonts = {
    enable = true;
    copy = true;
    source = ./myfonts;
    target = /Library/Fonts/myfonts;
  };
}
