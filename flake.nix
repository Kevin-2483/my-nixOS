{
  description = "A simple NixOS flake";
  inputs = {
    # NixOS 官方软件源，这里使用 nixos-23.11 分支
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager, used for managing user configuration
    home-manager = {
          url = "github:nix-community/home-manager/release-23.11";
          # The `follows` keyword in inputs is used for inheritance.
          # Here, `inputs.nixpkgs` of home-manager is kept consistent with
          # the `inputs.nixpkgs` of the current flake,
          # to avoid problems caused by different versions of nixpkgs.
          inputs.nixpkgs.follows = "nixpkgs";
        };

    # add ags
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, ... }@inputs: let
    inherit (self) outputs;
	in rec {
       inherit nixpkgs;
       inherit nixpkgs-unstable;
    # 因此请将下面的 my-nixos 替换成你的主机名称
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # specialArgs = { inheirt; inputs; };
      modules = [
        # 这里导入之前我们使用的 configuration.nix，
        # 这样旧的配置文件仍然能生效
        ./system
        ./hardware-config

        # 将 home-manager 配置为 nixos 的一个 module
        # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署
        home-manager.nixosModules.home-manager
        {
        	home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
        
            # 这里的 ryan 也得替换成你的用户名
            # 这里的 import 函数在前面 Nix 语法中介绍过了，不再赘述
            home-manager.users.kevin = import ./home;
        
            # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
            # 取消注释下面这一行，就可以在 home 中使用 flake 的所有 inputs 参数了
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
        }

        {
            # 将所有 inputs 参数设为所有子模块的特殊参数，
            # 这样就能直接在子模块中使用 inputs 中的所有依赖项了
            _module.args = { inherit inputs outputs; };
        }
                  
      ];
    };
    overlays = import ./overlays {inherit inputs;};
  };
}
