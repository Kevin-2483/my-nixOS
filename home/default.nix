{ config, pkgs, inputs, outputs, lib, username, ... }:

{

  home = {
    username = "${username}";
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
  };
  imports = [
    # inputs.ags.homeManagerModules.default # ags bar
    ./packages.nix # programs list
    ./programs # program setting
    ./theme.nix
    ./services
    ./homefile.nix
    ./shellScriptBin.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
