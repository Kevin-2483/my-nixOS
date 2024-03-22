
{ config, pkgs, inputs, ... }:

{
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.shells = with pkgs; [ zsh ];
  environment.variables = rec { EDITOR = "micro"; };
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
	
  ];
  
}
