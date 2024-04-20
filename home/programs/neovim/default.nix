{ pkgs, ... }:
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		package = pkgs.neovim-unwrapped;
		vimAlias = true;
		viAlias = true;
		# configure = {};
	};
}
