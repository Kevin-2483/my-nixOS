{ config, pkgs, inputs, outputs, lib, username, ... }:

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
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.darwin.defaults."com.apple.desktopservices".DSDontWriteUSBStores = true; # 是否阻止在 USB 驅動器上寫入 .DS_Store 文件。
  targets.darwin.defaults."com.apple.desktopservices".DSDontWriteNetworkStores = true; # 是否阻止在網絡卷上寫入 .DS_Store 文件。

}
