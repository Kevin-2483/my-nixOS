{ pkgs, ... }: let
  ny = pkgs.writeShellScriptBin "ny" ''${pkgs.nushell}/bin/nu -e yy'';
  wny = pkgs.writeShellScriptBin "wny" ''${wezterm}/bin/nu ${ny}'';
in {
  home.packages = [ ny wny ];
}