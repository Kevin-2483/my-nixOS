{ inputs, outputs, ... }:
let
  system = "x86_64-linux";
  hostname = "moreNixmoreFine";
  username = "kevin";
  pkgs = import inputs.nixos-unstable {
    inherit system;
    config.allowUnfree = true;
  };
  home-manager = inputs.home-manager;
  catppuccin = inputs.catppuccin;
in
{
  inherit system hostname username pkgs;
  machine-config = inputs.nixos-unstable.lib.nixosSystem {
    system = system;
    modules = [
      ../../systems/${hostname}
      ../../systems/${hostname}/hardware-config
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = false;
          useUserPackages = true;
          users.${username} = imports [ catppuccin.homeManagerModules.catppuccin ../../home ];
          extraSpecialArgs = { inherit inputs hostname username outputs system; };
        };
      }
      {
        _module.args = {
          inherit inputs hostname outputs username system;
        };
      }
    ];
  };
  overlays = {
    stable-packages = final: _prev: {
      stable = import inputs.nixos-stable {
        system = final.system;
        config.allowUnfree = true;
      };
    };
    master-packages = final: _prev: {
      master = import inputs.nixpkgs-master {
        system = final.system;
        config.allowUnfree = true;
      };
    };
  };
}
