{ pkgs, ... }: {
  imports = [ ./yabai ./skhd ./SketchyBar ./launchd ./jankyborders ];
  services.nix-daemon = { enable = true; };
}
