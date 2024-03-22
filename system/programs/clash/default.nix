{ config, pkgs, inputs, ... }:
{
	programs.clash-verge={
		package = pkgs.clash-verge-rev;
		enable = true;
		tunMode = true;
		autoStart = true;
		
	};
	
}
