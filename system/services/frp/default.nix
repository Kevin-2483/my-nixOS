
{ config, pkgs, inputs, ... }:

{
  
  services.frp = {
  		      enable = true;
  		      role = "client";
  		      settings = {
  		      serverAddr  = "222.186.150.252";
  		      serverPort = 54529;
  		      proxies = [
  		     """
  		      	type = tcp
  		      	localIp = 127.0.0.1
  		      	localPort = 3389
  		      	remotePort = 3389
  		      	name = RDPTCP
  		      	
  		      
  		        type = udp
  		      	localIp = 127.0.0.1
  		      	localPort = 3389
  		      	remotePort = 3389
  		      	name = RDPUDP
				
  		      
  		      	type = tcp
  		      	localIp = 127.0.0.1
  		      	localPort = 22
  		      	remotePort = 3388
  		      	name = SSH
  		      	"""
  		      	];
  		      	
  		      
  		      	
  		      };
  		      
  		          
  		      
  		    };

}
