{ pkgs, ... }:
{
  programs.nix-index = {
    enable = true;
    package = pkgs.nix-index;
  };
}
