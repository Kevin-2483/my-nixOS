{ lib, config, pkgs, inputs, username, ... }:

{

  environment.shells = with pkgs; [ nushell bash zsh ];
  environment.darwinConfig = "$HOME/.config/nix-darwin/flake.nix";
  environment.variables = rec {
    EDITOR = "lvim";
    JAVA_HOME = "/Users/kevin/Library/jdks/zulu21";
    PATH = "$JAVA_HOME/bin:$PATH";
  };
  environment.etc.flakeconfig = {
    enable = true;
    source = ./systemfile/nixconfig.nix;
    target = "flakeconfig.nix";
  };
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    xz
    connect
    micro
    git-lfs
    git-filter-repo
    ncurses
    nushell
    tmux
    pam-reattach
    yazi
  ];
}
