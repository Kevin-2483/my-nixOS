{ config, pkgs, lib, ... }:

{

  programs.hyprland = {
  	      enable = true;
  	      package = pkgs.unstable.hyprland;
  	      portalPackage = pkgs.xdg-desktop-portal-hyprland;
  	      xwayland.enable = true;
  	  
  	    };
}
