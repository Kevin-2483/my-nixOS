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
			dates = [ "6:00" ];
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
