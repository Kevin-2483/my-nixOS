
{ config, pkgs, inputs, ... }:

{
  
programs.proxychains = {
  		enable = true;
  		proxies = {
  			myproxy =
  			  { type = "socks5h";
  			    host = "127.0.0.1";
  			    port = 1080;
  			  };
  		};
  		
  		package = pkgs.proxychains-ng;
  		
  	};

}
