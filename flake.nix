{
  description = "Kevin's flake for nix-darwin";
  inputs = {
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-services = {
      url = "github:Homebrew/homebrew-services";
      flake = false;
    };
    catppuccin.url = "github:Kevin-2483/catppuccin-for-nix-darwin";
  };

  outputs =
    { self
    , nixpkgs-unstable
    , home-manager
    , catppuccin
    , nixpkgs-stable
    , nixpkgs-master
    , nix-homebrew
    , homebrew-bundle
    , homebrew-core
    , homebrew-cask
    , homebrew-services
    , darwin
    , ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "aarch64-darwin";
      hostname = "Kevin-MBA-M2";
      username = "kevin";
      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {

      darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          # 这里导入之前我们使用的 configuration.nix，
          # 这样旧的配置文件仍然能生效
          ./system
          catppuccin.darwinModules.catppuccin
          # 将 home-manager 配置为 nixos 的一个 module
          # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.users.${username}.imports =
              [ ./home catppuccin.homeManagerModules.catppuccin ];
            # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
            home-manager.extraSpecialArgs = {
              inherit catppuccin inputs hostname outputs username;
            };

          }

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;
              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;
              # User owning the Homebrew prefix
              user = "${username}";
              # Automatically migrate existing Homebrew installations
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "homebrew/homebrew-bundle" = homebrew-bundle;
                "homebrew/homebrew-services" = homebrew-services;
              };
              autoMigrate = true;
              mutableTaps = false;
            };
          }
          {
            _module.args = { inherit inputs hostname outputs username system; };
          }
          #(import ./overlays/steam.nix)
        ];
      };
      overlays = import ./overlays { inherit inputs; };
    };
}
