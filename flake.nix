{
  description = "Kevin's flake for nix-darwin";
  inputs = {
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:Kevin-2483/catppuccin-for-nix-darwin";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , catppuccin
    , nixpkgs-stable
    , darwin
    , ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "aarch64-darwin";
      hostname = "Kevin-MBA-M2";
      username = "kevin";
      pkgs = import nixpkgs {
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

          {
            _module.args = { inherit inputs hostname outputs username system; };
          }
          #(import ./overlays/steam.nix)         
        ];
      };
      overlays = import ./overlays { inherit inputs; };
    };
}
