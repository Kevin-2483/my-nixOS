{
  description = "Sketchybar Lua Support";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };

  outputs = { self, nixpkgs, ... }:
    let
      # Generate a user-friendly version number.
      version = builtins.substring 0 8 self.lastModifiedDate;

      # System types to support.
      supportedSystems =
        [ "x86_64-darwin" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      # Provide some binary packages for selected system types.
      packages = forAllSystems
        (system:
          {
            sketchybar_lua = nixpkgsFor.${system}.stdenvNoCC.mkDerivation
              {
                pname = "sketchybar_lua";
                version = version;

                src = nixpkgsFor.${system}.fetchFromGitHub {
                  owner = "FelixKratz";
                  repo = "SbarLua";
                  rev = "437bd2031da38ccda75827cb7548e7baa4aa9978";
                  hash = "sha256-F0UfNxHM389GhiPQ6/GFbeKQq5EvpiqQdvyf7ygzkPg=";
                };

                dontConfigure = true;
                dontBuild = true;

                installPhase = ''
                  runHook preInstall
                  cd SbarLua
                  make install
                  runHook postInstall
                '';

                meta = {
                  description = "sketchybar_lua";
                  homepage = "https://github.com/FelixKratz/SbarLua";
                  license = nixpkgs.lib.licenses.gpl;
                  maintainers = with nixpkgs.lib.maintainers; [ kevin ];
                  platforms = nixpkgs.lib.platforms.darwin;
                };
              };
          });

      # The default package for 'nix build'. This makes sense if the
      # flake provides only one package or there is a clear "main"
      # package.
      defaultPackage = forAllSystems (system: self.packages.${system}.sketchybar_lua);

      devShell = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in
        pkgs.mkShell {
          buildInputs = with pkgs; [ ];
        });
    };
}
