{ pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    # interactiveShellInit = ''
    # if [ -f /etc/static/bashrc ]; then
    #   grep -v 'shopt' /etc/static/bashrc > ~/.bashrc.tmp
    #   source ~/.bashrc.tmp
    #   rm ~/.bashrc.tmp
    # fi
    # '';
    enableCompletion = true;
    enableBashCompletion = true;
    enableFzfCompletion = true;
    enableSyntaxHighlighting = true;
  };
}
