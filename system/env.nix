{ config, pkgs, inputs, ... }:

{
  virtualisation.waydroid.enable = false;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  # Bootloader.
  # 设置为 GRUB 启动加载器
  boot.loader.grub.device = "/dev/sda"; # 选择你安装系统的硬盘
  boot.loader.grub.enable = true; # 启用 GRUB

  # 如果你使用 UEFI 引导，可以启用如下设置
  boot.loader.grub.useOSProber = true; # 启用自动发现操作系统（如果有多个系统）
  boot.loader.grub.efiSupport = false; # 启用 EFI 支持
  boot.loader.grub.efiInstallAsRemovable = false; # 如果需要设置为可移动设备

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
    # pam-reattac
    gcc
  ];

}
