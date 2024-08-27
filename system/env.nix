
{ lib, config, pkgs, inputs, ... }:

{

  environment.shells = with pkgs; [ nushell ];
  environment.variables = rec {
  	EDITOR = "micro";
  	# JAVA_HOME = "/home/kevin/AzulJDK/zing24.02.0.0-6-jdk17.0.10-linux_x64";
  	# PATH = "$JAVA_HOME/bin:$PATH";
  	};
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.useDaemon = true;
  services.nix-daemon.enable = true;
  environment.systemPackages = with pkgs; [
    wget
    curl
    git  
    xz
    connect
    micro
  ];
}
