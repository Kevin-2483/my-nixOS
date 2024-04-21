{ pkgs, ... }:
{
  programs.rio.enable = true;
  programs.rio.package = pkgs.rio;
  programs.rio.settings = {};
  programs.rio.catppuccin.enable = true;
}
