{ pkgs, ... }: let
  wezt = ''${pkgs.wezterm}/bin/wezterm "$@"'';
  xterm = pkgs.writeShellScriptBin "xterm" wezt;
  wez = pkgs.writeShellScriptBin "wez" wezt;

in {
  home.packages = [ pkgs.wezterm xterm wez ];
}
