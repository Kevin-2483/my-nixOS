{
  # systemd.services.nix-daemon.environment = {
  #   # socks5h mean that the hostname is resolved by the SOCKS server
  #   https_proxy = "socks5h://localhost:1080";
  #   http_proxy = "socks5h://localhost:1080";
  #   # https_proxy = "http://localhost:7890"; # or use http prctocol instead of socks5
  # };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault false;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;


  # Enable networking
  networking.networkmanager.enable = true;


  networking.hostName = "${hostname}"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # networking.hosts = {
  #   "127.0.0.2" = [ "other-localhost" ];
  #   "192.0.2.1" = [ "mail.example.com" "imap.example.com" ];
  # };

  # networking = {
  #   interfaces = {
  #     ens3.ipv6.addresses = [{
  #       address = "2a01:4f8:1c1b:16d0::1";
  #       prefixLength = 64;
  #     }];
  #   };
  #   defaultGateway6 = {
  #     address = "fe80::1";
  #     interface = "ens3";
  #   };
  # };
}
