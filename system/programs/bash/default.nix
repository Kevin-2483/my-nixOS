{ pkgs, lib, ... }:
{
  programs.bash = {
    enable = true;
    interactiveShellInit = ''
      if [ -f /etc/static/bashrc ]; then
        . /etc/static/bashrc
      fi
    '';
    enableCompletion = true;
  };
}