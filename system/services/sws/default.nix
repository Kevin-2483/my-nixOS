{ pkgs, ... }:
{
	services.static-web-server = {
	  enable = true;
	  root = "/home/kevin/services/sws";
	  listen = "[::]:8787";
	  configuration = {
	      general = { 
	        directory-listing = true;
	      };
	  };
	};
	
}
