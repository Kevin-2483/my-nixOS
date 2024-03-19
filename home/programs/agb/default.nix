{ inputs, config, pkgs, lib, ... }:

{

  programs.ags = {
  	      enable = true;
  	  
  	      # null or path, leave as null if you don't want hm to manage the config
  	      # configDir = ./ags;
  	  
  	      # additional packages to add to gjs's runtime
  	      extraPackages = with pkgs; [
  	        gtksourceview
  	        webkitgtk
  	        accountsservice
  	        bun
  	        dart-sass
  	        fd
  	        brightnessctl
  	        swww
  	        inputs.matugen.packages."x86_64-linux".default
  	        hyprpicker
  	        pavucontrol
  	        gnome.gnome-control-center
  	      ];
  	    };
}
