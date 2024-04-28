
{ lib, config, pkgs, inputs, ... }:

{
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  virtualisation.waydroid.enable = true;
  
  environment.shells = with pkgs; [ zsh nushell ];
  environment.variables = rec {
  	EDITOR = "micro";
  	JAVA_HOME = "/home/kevin/AzulJDK/zing24.02.0.0-6-jdk17.0.10-linux_x64";
  	PATH = "$JAVA_HOME/bin:$PATH";
  	};
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs;  with gnome; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
	  appimage-run
	  blueberry
	  frp
	  #proxychains
	  v2raya

	  wl-clipboard #Wayland 的命令行复制/粘贴实用程序
	  wf-recorder # 用于基于 wlroots 的合成器的屏幕录制的实用程序
	  wayshot #一个原生的、极快的屏幕截图工具，适用于基于 wlroots 的合成器（例如 sway 和 River)
	
	  #gnome
	  gnome.adwaita-icon-theme
	  loupe
    adwaita-icon-theme
    nautilus
    nautilus-open-any-terminal
    baobab
    gnome-text-editor
    gnome-calendar
    gnome-boxes
    gnome-system-monitor
    gnome-control-center
    gnome-weather
    gnome-calculator
    gnome-clocks
    gnome-software # for flatpak
    polkit_gnome
    wl-gammactl
    pavucontrol
    brightnessctl
    swww
    wlroots
    xdg-desktop-portal-wlr
    pulseaudio
    #pulseaudioFull
	  flatpak
	  # zulu17
	  xz
	  connect
	  virt-manager
	  virt-viewer
	  glfw-wayland-minecraft
	  qt6.qtwayland
	  libsForQt5.qt5.qtwayland
	  # nodejs_21
    libsForQt5.qt5.qtgraphicaleffects #for sddm
    libsForQt5.qt5.qtsvg # for sddm
    libsForQt5.qt5.qtquickcontrols2 # for sddm
    inputs.sddm-catppuccin.packages.${pkgs.hostPlatform.system}.sddm-catppuccin
    libappindicator-gtk3 # for runcat
    # xdg-desktop-portal-gnome
    # xdg-desktop-portal
    sdbus-cpp # for hypridle
    wayland-protocols # for hypridle
  ];
}
