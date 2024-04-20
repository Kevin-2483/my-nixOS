{ inputs, config, pkgs, lib, ... }:

{

  programs.hyprland = {
  	      enable = true;
  	      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  	      portalPackage = pkgs.xdg-desktop-portal-hyprland;
  	      xwayland.enable = true;
  	      # enableNvidiaPatches = true;
  	  
  	    };
#  catppuccin.enable = true;
  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
      	# xdg-desktop-portal-hyprland
        xdg-desktop-portal-wlr
        # xdg-desktop-portal-gtk
      ];
    };

    
}
