{ pkgs, lib, ... }: {
  programs.bash = {
    enable = true;
    interactiveShellInit = ''
      export LC_CTYPE="en_US.UTF-8"
      export PATH="/opt/homebrew/bin:$PATH"
       if [ -f /etc/static/bashrc ]; then
        . /etc/static/bashrc
      fi
    '';
    completion.enable = true;
  };
}
