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
      url = "github:homebrew/homebrew-services";
      flake = false;
    };
    mihomo-party = {
      url = "github:mihomo-party-org/homebrew-mihomo-party";
      flake = false;
    };
    playcover = {
      url = "github:PlayCover/homebrew-playcover";
      flake = false;
    };
    #for font-sarasa-nerd
    laishulu = {
      url = "github:laishulu/homebrew-homebrew";
      flake = false;
    };
    # xpipe-io = {
    #   url = "github:xpipe-io/homebrew-tap";
    #   flake = false;
    # };
    # Homebrew 解析 Tap 时，会将 <用户/组织名>/<Tap 名称> 转换为 GitHub 上的 homebrew-<Tap 名称> 形式的仓库。
    # 例如 tap:mihomo-party-org/mihomo-party 会被解析为 github:mihomo-party-org/homebrew-mihomo-party
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    { self
    , nixpkgs-unstable
    , home-manager
    , catppuccin
    , nix-homebrew
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
        system = system;
        modules = [
          # 这里导入之前我们使用的 configuration.nix，
          # 这样旧的配置文件仍然能生效
          ./system
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
              # 在这里添加Inputs中引入的taps
              # 请确保taps中的tap名称包括了homebrew-前缀来正确定位到对应的仓库
              # Intel: /usr/local/Homebrew/Library/Taps/
              # Apple Silicon:   /opt/homebrew/Homebrew/Library/Taps/
              taps = {
                "homebrew/homebrew-core" = inputs.homebrew-core;
                "homebrew/homebrew-cask" = inputs.homebrew-cask;
                "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
                "homebrew/homebrew-services" = inputs.homebrew-services;
                "mihomo-party-org/homebrew-mihomo-party" = inputs.mihomo-party;
                # "xpipe-io/homebrew-tap" = inputs.xpipe-io;
                "PlayCover/homebrew-playcover" = inputs.playcover;
                "laishulu/homebrew-homebrew" = inputs.laishulu;
              };
              # Automatically migrate existing Homebrew installations
              autoMigrate = false;
              # Optional: Enable fully-declarative tap management
              #
              # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
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
