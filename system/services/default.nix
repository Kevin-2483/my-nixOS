
{ config, pkgs, inputs, username, hostname, ... }:

{
  imports =
    [
     # ./frp
     ./openssh
     ./docker
     #./hotspot
     ./ts
     ./frpc
     ./cloudreve
     #./meshcentral
     ./sws
     ./samba
    ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  # Enable CUPS to print documents.
  services = {
        xserver = {
          enable = true;
          # excludePackages = [ pkgs.xterm ];
        };
        printing.enable = true;
        flatpak.enable = true;
      };

  # Enable the GNOME Desktop Environment.
  # 23.11
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # the option has out use below
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  # services.xserver.displayManager.startx.enable = true;
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

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
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  services = {

  	  v2raya.enable = true;
      gvfs.enable = true;
      devmon.enable = true;
      udisks2.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = true;
    };
    services.gnome.gnome-settings-daemon.enable = true;
    services.udev.packages = with pkgs; [gnome.gnome-settings-daemon ];

}
