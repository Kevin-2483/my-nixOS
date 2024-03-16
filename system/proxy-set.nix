{
  systemd.services.nix-daemon.environment = {
    # socks5h mean that the hostname is resolved by the SOCKS server
    https_proxy = "socks5h://localhost:1080";
    http_proxy = "socks5h://localhost:1080";
    # https_proxy = "http://localhost:7890"; # or use http prctocol instead of socks5
  };
}
