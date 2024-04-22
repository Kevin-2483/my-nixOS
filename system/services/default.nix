
{ config, pkgs, inputs, username, hostname, asztal, ... }:

{
  imports =
    [
     ./frp
     ./openssh
     ./xrdp
     ./mysql
    ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  # Enable CUPS to print documents.
  services = {
        xserver = {
          enable = true;
          libinput.enable = true;
          excludePackages = [ pkgs.xterm ];
        };
        printing.enable = true;
        flatpak.enable = true;
      };

  # Enable the GNOME Desktop Environment.
  # 23.11
  services.xserver.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "catppuccin";
  services.xserver.desktopManager.gnome.enable = true;
  # the option has out use below
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  services.xserver.displayManager.startx.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.udev.extraRules = ''
      KERNEL=="rtc0", GROUP="audio"
      KERNEL=="hpet", GROUP="audio"
    '';
  # services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
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

 services.greetd = {
    enable = false;
    vt = 1;
    # settings.default_session.command = "ly";
    settings.default_session = {
    command = pkgs.writeShellScript "greeter" ''
      export XDG_RUNTIME_DIR=/run/user/1000
      export XKB_DEFAULT_LAYOUT=${config.services.xserver.xkb.layout}
      export XCURSOR_THEME=Qogir
      ${asztal}/bin/greeter
    '';
    user = "kevin";
    };
  };

  services = {

  	  v2raya.enable = true;
      gvfs.enable = true;
      devmon.enable = true;
      udisks2.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = true;
      accounts-daemon.enable = true;
      #blueman.enable = true;
      gnome = {
        evolution-data-server.enable = true;
        glib-networking.enable = true;
        gnome-keyring.enable = true;
        gnome-online-accounts.enable = true;
        #gnome-settings-daemon.enable = true;
      };
    };

    systemd.tmpfiles.rules = [
        "d '/var/cache/greeter' - greeter greeter - -"
      ];

      systemd = {
        	      user.services.polkit-gnome-authentication-agent-1 = {
        	        description = "polkit-gnome-authentication-agent-1";
        	        wantedBy = [ "graphical-session.target" ];
        	        wants = [ "graphical-session.target" ];
        	        after = [ "graphical-session.target" ];
        	        serviceConfig = {
        	          Type = "simple";
        	          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        	          Restart = "on-failure";
        	          RestartSec = 1;
        	          TimeoutStopSec = 10;
        	        };
        	      };
        	    };

      # system.activationScripts.wallpaper = ''
      #     PATH=$PATH:${pkgs.coreutils}/bin:${pkgs.gawk}/bin:${pkgs.jq}/bin
      #     CACHE="/var/cache/greeter"
      #     OPTS="$CACHE/options.json"
      # 
      #     cp /home/${username}/.cache/ags/options.json $OPTS
      #     chown greeter:greeter $OPTS
      # 
      #     BG=$(cat $OPTS | jq -r '.wallpaper // "/home/${username}/.config/background"')
      # 
      #     cp $BG $CACHE/background
      #     chown greeter:greeter $CACHE/background
      #   '';

}
