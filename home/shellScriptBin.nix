{ pkgs, ... }: let
  ny = pkgs.writeShellScriptBin "ny" ''${pkgs.nushell}/bin/nu -e "yy '$@'"'';
  kny = pkgs.writeShellScriptBin "kny" ''
  if [ "$#" -eq 0 ]; then
    ${pkgs.kitty}/bin/kitty ny "$HOME"
  else
    ${pkgs.kitty}/bin/kitty ny "$@"
  fi
  '';
  wny = pkgs.writeShellScriptBin "wny" ''
  if [ "$#" -eq 0 ]; then
    ${pkgs.wezterm}/bin/wezterm -e ny "$HOME"
  else
    ${pkgs.wezterm}/bin/wezterm -e ny "$@"
  fi
  '';
  wez = pkgs.writeShellScriptBin "wez" ''${pkgs.wezterm}/bin/wezterm "$@"'';
  wtm = pkgs.writeShellScriptBin "wtm" ''
  if [ "$#" -eq 0 ]; then
     ${pkgs.tmux}/bin/tmux new-session -d -s default;${pkgs.wezterm}/bin/wezterm -e tmux attach -t default
  else
      ${pkgs.tmux}/bin/tmux new-session -d -s "$@";${pkgs.wezterm}/bin/wezterm -e tmux attach -t "$@"
  fi
  '';
  ktm = pkgs.writeShellScriptBin "ktm" ''
  if [ "$#" -eq 0 ]; then
     ${pkgs.tmux}/bin/tmux new-session -d -s default;${pkgs.kitty}/bin/kitty tmux attach -t default
  else
      ${pkgs.tmux}/bin/tmux new-session -d -s "$@";${pkgs.kitty}/bin/kitty tmux attach -t "$@"
  fi
  '';
  tm = pkgs.writeShellScriptBin "tm" ''
  if [ "$#" -eq 0 ]; then
     ${pkgs.tmux}/bin/tmux new-session -d -s default;${pkgs.tmux}/bin/tmux attach -t default
  else
      ${pkgs.tmux}/bin/tmux new-session -d -s "$@";${pkgs.tmux}/bin/tmux attach -t "$@"
  fi
  '';
  yabai-reload = pkgs.writeShellScriptBin "yabai-reload" ''
  sudo launchctl stop org.nixos.yabai-sa
  sudo launchctl start org.nixos.yabai-sa
  ''; 
in {
  home.packages = [ ny kny wny wez wtm ktm tm yabai-reload ];
}