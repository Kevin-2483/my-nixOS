{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      hostname = "moreNixmoreFine";
      username = "kevin";
      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./system
          ./hardware-config
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              users.${username} = import ./home;
              extraSpecialArgs = { inherit inputs hostname username outputs; };
            };
              }
              {
              _module.args = { inherit inputs hostname outputs username;
          };
          }
        ];
      };
      overlays = import ./overlays { inherit inputs; };
    };
}
