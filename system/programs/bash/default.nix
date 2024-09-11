{ pkgs, lib, ... }:
{
  programs.bash = {
    enable = true;
    interactiveShellInit = ''
    export PATH="/opt/homebrew/bin:$PATH"
     if [ -f /etc/static/bashrc ]; then
      . /etc/static/bashrc
    fi
    '';
    enableCompletion = true;
  };
}