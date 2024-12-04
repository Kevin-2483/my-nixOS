{ config, pkgs, lib, ... }:

{
  programs.fzf = {
    enable = true;
    catppuccin.enable = false;
  };
}
