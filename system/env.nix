
{ config, pkgs, inputs, ... }:

{
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  virtualisation.waydroid.enable = false;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  
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
	unstable.v2raya
	#unstable.nautilus-open-any-terminal
	gnome-boxes
	gnome-software # for flatpak
	flatpak
	# gnomeExtensions.appindicator
	gnome.gnome-settings-daemon
	static-web-server
  ];
  
}
