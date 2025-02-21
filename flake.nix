{
  description = "Kevin's flake for nix-darwin";
  inputs = {
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
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
    { self, ... }@inputs:
    let
      inherit (self) outputs;
      machines = import ./machines;
      machine = machines.${hostname} { inherit inputs outputs; };
      system = machine.system;
    in
    {
      darwinConfigurations.${machine.hostname} = if system == "aarch64-darwin" || "x86_64-darwin" then machine.machine-config else null;
      nixosConfigurations.${machine.hostname} = if system == "x86_64-linux" || "aarch64-linux" then machine.machine-config else null;
      overlays = machine.overlays;
    };
}
