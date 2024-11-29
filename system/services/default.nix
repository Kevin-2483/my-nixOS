{ pkgs, ... }: {
  imports = [ ./yabai ./skhd ./SketchyBar ./launchd ];
  services.nix-daemon = { enable = true; };
}
