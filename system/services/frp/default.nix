
{ config, pkgs, inputs, ... }:

{
  
  services.frp = {
  		      enable = true;
  		      role = "client";
  		      settings = {
  		      common={
  		      server_addr  = "222.186.150.252";
  		      server_port = 54529;
  		      };
  		      RDPTCP = {
  		      	type = "tcp";
  		      	local_ip = "127.0.0.1";
  		      	local_port = "3389";
  		      	remote_port = "3389";
  		      };
  		      RDPUDP = {
  		      	      	type = "udp";
  		      	      	local_ip = "127.0.0.1";
  		      	      	local_port = "3389";
  		      	      	remote_port = "3389";
  		      	      };
  		      SSH = {
  		      	type = "tcp";
  		        local_ip = "127.0.0.1";
  		      	local_port = "22";
  		      	remote_port = "3388";
  		      };
  		          
  		      };
  		    };

}
