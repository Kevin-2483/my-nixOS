{ config, pkgs, inputs, ... }:

{

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

}
