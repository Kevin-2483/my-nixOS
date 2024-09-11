{ pkgs, ... }: let
  wez = ''${pkgs.wezterm}/bin/wezterm "$@"'';
  xterm = pkgs.writeShellScriptBin "xterm" wez;

in {
  home.packages = [ pkgs.wezterm xterm wez ];
}
