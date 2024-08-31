{ pkgs, lib, ... }:
{
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
  };
}