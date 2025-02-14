{ pkgs, username, ... }:
let
  tm = pkgs.writeShellScriptBin "tm" ''
    if [ "$#" -eq 0 ]; then
       ${pkgs.tmux}/bin/tmux new-session -d -s default;${pkgs.tmux}/bin/tmux attach -t default
    else
        ${pkgs.tmux}/bin/tmux new-session -d -s "$@";${pkgs.tmux}/bin/tmux attach -t "$@"
    fi
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
in
{
  home.packages = [ tm pidof ];
}
