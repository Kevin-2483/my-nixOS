{ config, pkgs, inputs, ... }:

{
  virtualisation.waydroid.enable = false;

  boot.kernelPackages = pkgs.linuxKernel.kernels.linux_zen;
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.shells = with pkgs; [ nushell bash zsh ];
  environment.variables = rec { EDITOR = "nvim"; };
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
    # pam-reattach
  ];

}
