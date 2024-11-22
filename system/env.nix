{ lib, config, pkgs, inputs, username, ... }:

{

  environment.shells = with pkgs; [ nushell bash zsh ];
  environment.darwinConfig = "$HOME/.config/nix-darwin/flake.nix";
  environment.variables = rec {
    EDITOR = "lvim";
    # JAVA_HOME = "/home/kevin/AzulJDK/zing24.02.0.0-6-jdk17.0.10-linux_x64";
    # PATH = "$JAVA_HOME/bin:$PATH";
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
  ];
}
