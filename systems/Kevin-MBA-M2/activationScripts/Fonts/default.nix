{ pkgs, username, ... }: {
  system.activationScripts.fonts = {
    enable = false;
    copy = true;
    source = ../../../home/dotfile/Fonts;
    target = /Users/${username}/Library/Fonts/myfonts;
  };
}
