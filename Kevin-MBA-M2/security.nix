{ config, pkgs, inputs, outputs, ... }:

{
  imports = [
    ../custom/newpam.nix
  ];
  security.newpam = {
    enableSudoTouchIdAuth = true;
    enablePamReattach = true;
  };

}
