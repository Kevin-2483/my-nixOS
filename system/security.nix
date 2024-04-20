# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 3389 3306 53317 ];
  networking.firewall.allowedUDPPorts = [ 3389 53317 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # kde connect
    networking.firewall = rec {
      allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
      allowedUDPPortRanges = [{ from = 1714; to = 1764; }];
    };
  

  security.rtkit.enable = true;
  security={
  	pam.services.ags = {};
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
  security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"   ; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio" ; type = "-"   ; value = "99"       ; }
    { domain = "@audio"; item = "nofile" ; type = "soft"; value = "99999"    ; }
    { domain = "@audio"; item = "nofile" ; type = "hard"; value = "524288"    ; }
  ];

  
}
