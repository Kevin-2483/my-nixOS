{ config, pkgs, lib, ... }:

{
  programs.git = {
  		package = pkgs.git;
  		enable = true;
  		userName  = "Kevin-2483";
  		userEmail = "3244577394@qq.com";
  	};
}
