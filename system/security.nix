{ config, pkgs, inputs, ... }:

{
  security.pam.enableSudoTouchIdAuth = true;
}
