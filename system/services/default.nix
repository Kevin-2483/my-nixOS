{ pkgs, ... }:
{
  imports = [
    ./yabai
    ./skhd
    ./SketchyBar
  ];
  services.nix-daemon = {
    enable = true;
  };
}
