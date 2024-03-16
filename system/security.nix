# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 3389 ];
  networking.firewall.allowedUDPPorts = [ 3389 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  security={
  	sudo.extraRules = [
  	  {
  	  	users = [ "kevin" ];
  	  	  	commands = [
  	  	  		{
  	  	  			command = "ALL" ;
  	  	  			options = [ "NOPASSWD" ];
  	  	  		}
  	  	  	];
  	  }
  	  ];
  	  polkit = {
  	  	enable = true;
  	  	extraConfig = ''
  	  	    polkit.addRule(function(action, subject) {
  	  	      if (
  	  	        subject.isInGroup("users")
  	  	          && (
  	  	            action.id == "org.freedesktop.login1.reboot" ||
  	  	            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
  	  	            action.id == "org.freedesktop.login1.power-off" ||
  	  	            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
  	  	          )
  	  	        )
  	  	      {
  	  	        return polkit.Result.YES;
  	  	      }
  	  	    })
  	  	  '';
  	  };
  };
}
