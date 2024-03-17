{ config, pkgs, lib, ... }:

{

  programs.yazi = {
  		package = pkgs.unstable.yazi;
  		enable = true;
  	};
}
