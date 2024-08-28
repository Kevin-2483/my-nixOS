{
  imports = [
    ./yabai
    # ./skhd
  ];
  services.nix-daemon = {
    enable = true;
  };
}