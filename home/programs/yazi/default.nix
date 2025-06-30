{ config, pkgs, lib, ... }:

{

  programs.yazi = {
    package = pkgs.stable.yazi;
    enable = true;
  };
}
