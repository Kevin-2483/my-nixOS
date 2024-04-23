{ config, pkgs, lib, ... }:

{
  programs.fuzzel = {
  		enable = true;
  		settings = {
  			main = {
  				font = "Fantasque Sans Mono";
  				terminal = "foot";
  				prompt = ">> ";
  				layer = "overlay";
  			};
  			colors = {
  				background = "1e1e2edd";
  				text = "cdd6f4ff";
  				selection = "585b70ff";
  				selection-text="cdd6f4ff";
  				border = "b4befeff";
  				match = "f38ba8ff";
  				selection-match = "f38ba8ff";
  				
  			};
  			border = {
  				radius=20;
  				width=6;
  				};
  			dmenu = {
  				exit-immediately-if-empty="yes";
  			};	
  		};
  	};
}
