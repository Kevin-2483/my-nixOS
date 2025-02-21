{
  system.activationScripts.flakeconfig = {
    enable = true;
    source = ./flakeconfig;
    target = /etc/flakeconfig;
  }
}