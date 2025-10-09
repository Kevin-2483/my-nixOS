{
  services.create_ap = {
    enable = true;
    settings = {
      INTERNET_IFACE = "OpenWrtBridge";
      WIFI_IFACE = "wlp3s0";
      SSID = "5900HX";
      PASSPHRASE = "NixOS6065G";
    };
  };
}
