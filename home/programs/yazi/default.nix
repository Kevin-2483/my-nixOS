{ config, pkgs, lib, ... }:

{

  programs.yazi = {
  		package = pkgs.yazi;
  		enable = true;
      catppuccin.enable = true;
  	};
}
