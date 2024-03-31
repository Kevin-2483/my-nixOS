
{ config, pkgs, inputs, ... }:

{
 
  services.mysql = {
  		enable = true;
  		package = pkgs.mariadb;
		ensureUsers= [
			{
				name = "kevin";
				ensurePermissions = {
					"*.*" = "ALL PRIVILEGES";
									};
			}
				
		];
		configFile = pkgs.writeText "my.cnf" ''
		  [mysqld]
		  bind-address = 127.0.0.1
		  port = 3306
		'';
		
  	};
  	
}
