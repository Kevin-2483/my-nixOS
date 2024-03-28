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
  				background = "111012ee";
  				text = "e7e0e5ff";
  				selection = "4b454dff";
  				selection-text="E5B0E7ff";
  				border = "E5B0E7ff";
  				match = "e4b5ffff";
  				selection-match = "e4b5ffff";
  				
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
