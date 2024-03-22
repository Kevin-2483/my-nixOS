
{ config, pkgs, inputs, ... }:

{
  
programs.proxychains = {
  		enable = true;
  		proxies = {
  			myproxy =
  			  { type = "socks5";
  			    host = "127.0.0.1";
  			    port = 1080;
  			    enable = true;
  			  };
  		};
  		
  		package = pkgs.proxychains-ng;
  		
  	};

}
