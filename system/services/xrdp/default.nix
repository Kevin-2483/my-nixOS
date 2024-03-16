
{ config, pkgs, inputs, ... }:

{
 
  services.xrdp = {
  		enable = true ;
  		port = 3389;
  		package = pkgs.xrdp;
  		defaultWindowManager = "gnome-remote-desktop";
  		
  	};
  	
}
