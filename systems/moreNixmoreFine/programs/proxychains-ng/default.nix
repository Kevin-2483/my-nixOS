{ config, pkgs, inputs, ... }:

{

  programs.proxychains = {
    enable = true;
    proxies = {
      myproxy =
        {
          type = "socks5";
          host = "10.1.0.10";
          port = 1080;
          enable = true;
        };
    };

    package = pkgs.proxychains-ng;
  };

}
