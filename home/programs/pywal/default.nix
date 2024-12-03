{ lib, pkgs, ... }:
{
  programs.pywal = {
    enable = true;
    package = pkgs.pywal;
  };
}