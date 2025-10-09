# ./machines/Kevin-MBA-M2/default.nix
{ inputs, outputs, ... }:
let
  system = "aarch64-darwin";
  hostname = "Kevin-MBA-M2";
  username = "kevin";
  pkgs = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
  nix-homebrew = inputs.nix-homebrew;
  home-manager = inputs.home-manager;
  catppuccin = inputs.catppuccin;
in
{
  inherit system hostname username pkgs nix-homebrew home-manager catppuccin;
  machine-config = inputs.darwin.lib.darwinSystem {
    system = system;
    modules = [
      ../../systems/${hostname}
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        home-manager.users.${username}.imports =
          [ ../../home catppuccin.homeModules.catppuccin ];
        # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
        home-manager.extraSpecialArgs = {
          inherit catppuccin inputs hostname outputs username system;
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
            "pot-app/homebrew-tap" = inputs.pot;
            "xwjdsh/homebrew-tap" = inputs.lunar;
            "koekeishiya/homebrew-formulae" = inputs.yabai;
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
  # overlays = import ./overlays { inherit inputs; };
  overlays = {
    stable-packages = final: _prev: {
      stable = import inputs.nixpkgs-stable-darwin {
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

