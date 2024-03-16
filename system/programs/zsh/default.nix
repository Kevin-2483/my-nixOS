
{ config, pkgs, inputs, ... }:

{
  
programs.zsh = {
  		enable = true;
  		ohMyZsh={
  			package = pkgs.oh-my-zsh;
  			enable = true;
  			customPkgs = [];
  			custom = null;
  			cacheDir = "$HOME/.cache/oh-my-zsh";
  		};
  	};

}
