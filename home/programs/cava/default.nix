{ pkgs, ... }:
{
  programs.cava = {
    enable = true;
    package = pkgs.cava;
    catppuccin.enable = true;
  };
}
