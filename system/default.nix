{ config, pkgs, inputs, outputs, ... }:

{
  imports = [
    ./substituters.nix
    ./env.nix
    ./fonts.nix
    ./security.nix
    ./user.nix
    ./setting.nix
    ./programs
    ./services
    ./homebrew
    ./activationScripts
    ./builder
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.stable-packages
      outputs.overlays.master-packages
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };
  nixpkgs.config.allowBroken = true;

}
