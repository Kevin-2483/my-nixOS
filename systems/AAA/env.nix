{ config, pkgs, inputs, ... }:

{
  virtualisation.waydroid.enable = false;

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  # Bootloader.
  boot.loader.systemd-boot = {
    enable = true;
    edk2-uefi-shell.enable = true;
    memtest86.enable = true;
    netbootxyz.enable = true;
    configurationLimit = 3;
    consoleMode = "auto";
  };
  environment.shells = with pkgs; [ nushell bash zsh ];
  environment.variables = rec { EDITOR = "nvim"; hostname = "AAA"; };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
    yazi
    # pam-reattac
    gcc
    inputs.caelestia-shell.packages.${pkgs.system}.default
  ];

}
