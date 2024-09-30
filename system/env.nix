
{ lib, config, pkgs, inputs, ... }:

{

  environment.shells = with pkgs; [ nushell bash zsh ];
  environment.variables = rec {
  	EDITOR = "micro";
  	# JAVA_HOME = "/home/kevin/AzulJDK/zing24.02.0.0-6-jdk17.0.10-linux_x64";
  	# PATH = "$JAVA_HOME/bin:$PATH";
  	};
  environment.systemPackages = with pkgs; [
    wget
    curl
    git  
    xz
    connect
    micro
    git-lfs
  ];
}
