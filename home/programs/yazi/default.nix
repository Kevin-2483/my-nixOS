{ config, pkgs, lib, ... }:

{

  programs.yazi = {
    package = pkgs.master.yazi;
    enable = true;
  };
}
