{ pkgs, username, ... }:
let
  ny = pkgs.writeShellScriptBin "ny" ''${pkgs.nushell}/bin/nu -e "yy '$@'"'';
  kny = pkgs.writeShellScriptBin "kny" ''
    if [ "$#" -eq 0 ]; then
      ${pkgs.kitty}/bin/kitty ny "$HOME"
    else
      ${pkgs.kitty}/bin/kitty ny "$@"
    fi
  '';
  rny = pkgs.writeShellScriptBin "rny" ''
    if [ "$#" -eq 0 ]; then
      ${pkgs.rio}/bin/rio -e ny "$HOME"
    else
      ${pkgs.rio}/bin/rio -e ny "$@"
    fi
  '';
  rtm = pkgs.writeShellScriptBin "rtm" ''
    if [ "$#" -eq 0 ]; then
       ${pkgs.tmux}/bin/tmux new-session -d -s default;${pkgs.rio}/bin/rio -e tmux attach -t default
    else
        ${pkgs.tmux}/bin/tmux new-session -d -s "$@";${pkgs.rio}/bin/rio -e tmux attach -t "$@"
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
  hmcl = pkgs.writeShellScriptBin "hmcl" ''
    export JAVA_HOME=/Users/${username}/Library/jdks/zulu21/
    export PATH=$JAVA_HOME/bin:$PATH
    java -jar /Users/${username}/Library/minecraft/HMCL-3.5.9.jar
  '';
in { home.packages = [ ny kny rny rtm ktm tm yabai-reload hmcl]; }
