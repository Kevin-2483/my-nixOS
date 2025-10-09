{ config, pkgs, inputs, username, hostname, ... }:

{
  imports =
    [
      ./openssh
      ./docker
      # ./hotspot
      # ./cloudreve
      # ./sws
      # ./samba
    ];

  # Enable the X11 windowing system.
  # Enable CUPS to print documents.
  services = {
    xserver = {
      enable = false;
      # excludePackages = [ pkgs.xterm ];
      xkb.layout = "us";
      xkb.variant = "";
      libinput.enable = true;
    };
    printing.enable = true;
    flatpak.enable = true;
  };

  services.displayManager.gnome.enable = false;
  services.displayManager.gdm.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    media-session.enable = true;
  };

  services = {
    # v2raya.enable = true;
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    # power-profiles-daemon.enable = true;
  };
  # services.gnome.gnome-settings-daemon.enable = true;
  # services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
