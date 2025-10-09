{ lib, hostname, ... }:
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
  boot.kernelParams = [ "net.ifnames=0" ];
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}"; # Define your hostname.
    useDHCP = lib.mkDefault true;
    wireless.enable = true; # Enables wireless support via wpa_supplicant.
    interfaces =
      {
        eth0 = {
          useDHCP = lib.mkDefault false;
          ipv4.addresses = [{
            address = "10.1.0.168";
            prefixLength = 24;
          }];
        };
      };
    defaultGateway = {
      address = "10.1.0.10";
      interface = "eth0";
    };
    nameservers = [
      "10.1.0.10"
      "8.8.8.8"
      "8.8.4.4"
      # "2001:4860:4860::8888"
      # "2001:4860:4860::8844"
    ];
    # defaultGateway6 = {
    # 	address = "fe80::1";
    # 	interface = "ens3";
    # };
    # hosts = {
    #	"127.0.0.2" = [ "other-localhost" ];
    #	"192.0.2.1" = [ "mail.example.com" "imap.example.com" ];
    # };
    # proxy = {
    # 	default = "http://user:password@proxy:port/";
    # 	noProxy = "127.0.0.1,localhost,internal.domain";
    # };

  };

}
