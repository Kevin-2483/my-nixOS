{ pkgs, ... }:
let
  wezt = ''${pkgs.wezterm}/bin/wezterm "$@"'';
  xterm = pkgs.writeShellScriptBin "xterm" wezt;
  ny = "${pkgs.nushell}/bin/nu";
in
{ home.packages = [ pkgs.wezterm xterm ]; }
