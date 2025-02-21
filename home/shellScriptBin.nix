{ pkgs, username, system, ... }:
let
  ny = pkgs.writeShellScriptBin "ny" ''${pkgs.nushell}/bin/nu -e "yy '$@'"'';
  kny = pkgs.writeShellScriptBin "kny" ''
    if [ "$#" -eq 0 ]; then
      ${pkgs.kitty}/bin/kitty ny "$HOME"
    else
      ${pkgs.kitty}/bin/kitty ny "$@"
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
    java -jar /Users/${username}/Library/minecraft/HMCL-*.jar
  '';
  pidof = pkgs.writeShellScriptBin "pidof" ''
      #!/bin/bash

    # Check if process name is passed as argument
    if [ -z "$1" ]; then
      echo "Usage: $0 [-s] <process_name>"
        exit 1
        fi

        # Check for the -s option
        single=false
    if [ "$1" == "-s" ]; then
    single=true
    shift # Remove -s option
    fi

    # Get the process name (case-sensitive)
    process_name="$1"

    # Get the PID(s) of the running processes matching the process name
    pids=$(ps aux | grep -w "$process_name" | grep -v "grep" | awk '{print $2}')

    # If no PIDs found, print an error message
    if [ -z "$pids" ]; then
    echo "No process found for $process_name"
    exit 1
    fi

    # If -s flag is set, return only the first PID
    if [ "$single" = true ]; then
    echo "$pids" | head -n 1
    else
      echo "$pids"
        fi
  '';
  # 判断当前平台
  isMacOS = system == "x86_64-darwin" || system == "aarch64-darwin";
  isLinux = system == "x86_64-linux" || system == "aarch64-linux";
  # Platform-specific packages
  platformSpecificPackages =
    (if isMacOS then [
      yabai-reload hmcl
    ] else []) ++
    (if isLinux then [
    ] else []);
in
{
  home.packages = [ ny kny ktm tm pidof ] ++ platformSpecificPackages;
}
