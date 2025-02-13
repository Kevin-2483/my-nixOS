{ lib, config, pkgs, ... }:

{
  programs.fd = {
    enable = true;
    hidden = false;
    package = pkgs.fd;
    ignores = [ ".git" "node_modules" "target" ];
    extraOptions = [ ];
  };
}
