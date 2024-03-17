
{ config, pkgs, inputs, ... }:

{
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.shells = with pkgs; [ zsh ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
	appimage-run
	gnome.gnome-remote-desktop
	frp
	brightnessctl
	sass
	ydotool
	slurp
	gojq
	wl-clipboard
	grim
  ];
  
}
