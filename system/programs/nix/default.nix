{ pkgs, ... }:
{
	nix = {
		enable = true;
		package = pkgs.nix;
		gc = {
			automatic = true;
			dates = "weekly";
			persistent = true;
		};
		optimise = {
			automatic = true;
			dates = "weekly";
			persistent = true;
		};
		settings = {
			auto-optimise-store = true;
		};
		sshServe = {
			enable = true;
			protocol = "ssh";
			write = true;
		};
		
	};
}
