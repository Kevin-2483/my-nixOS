{ username, system, ... }:
let
  # 判断当前平台
  isMacOS = system == "x86_64-darwin" || system == "aarch64-darwin";
  isLinux = system == "x86_64-linux" || system == "aarch64-linux";
  # Platform-specific packages
  platformSpecificSettings =
    (if isMacOS then [
      ./darwin.nix
    ] else [ ]) ++
    (if isLinux then [ ] else [ ]);
in
{

  home = {
    username = "${username}";
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
  };
  imports = [
    # inputs.ags.homeManagerModules.default # ags bar
    ./packages.nix # programs list
    ./programs # program setting
    ./theme.nix
    ./services
    ./homefile.nix
    ./shellScriptBin.nix
  ] ++ platformSpecificSettings;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
