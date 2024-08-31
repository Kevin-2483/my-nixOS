{ pkgs, ... }:
{
  imports = [
    ./yabai
    ./skhd
  ];
  services.nix-daemon = {
    enable = true;
  };
  # launchd.daemons = {
  #   jankyborders = {
  #     command = "${pkgs.jankyborders}/bin/borders active_color=0xffF8BBD0 inactive_color=0xff90CAF9 width=15.0 &";
  #   };
  # };
}