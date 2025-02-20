{ pkgs, ... }: {
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    extraPackages = [ pkgs.master.sketchybar-app-font pkgs.jq pkgs.nowplaying-cli pkgs.nix pkgs.wallust ];
  };
}
