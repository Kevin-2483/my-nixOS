{ pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;
    defaultCommand = "/bin/bash";
  };
}