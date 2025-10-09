{ config, pkgs, inputs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = true; # disable password login
    };
    openFirewall = true;
  };

}
