{ pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;
    defaultCommand = "/etc/profiles/per-user/kevin/bin/nu";
  };
}