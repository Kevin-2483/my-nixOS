{ pkgs, ... }: {
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    extraPackages = [ pkgs.sketchybar-app-font pkgs.jq pkgs.nowplaying-cli pkgs.nix ];
  };
}
