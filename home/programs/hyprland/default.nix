{ config, pkgs, lib, ... }:

{

  programs.hyprland = {
  	      enable = true;
  	      package = pkgs.hyprland;
  	      portalPackage = pkgs.xdg-desktop-portal-hyprland;
  	      xwayland.enable = true;
  	  
  	    };
}
