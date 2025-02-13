{ pkgs, ... }:
{
  nix.linux-builder = {
    enable = true;
    ephemeral = false; # Whether to enable wipe the builder's filesystem on every restart.
    package = pkgs.darwin.linux-builder;
    protocol = "ssh-ng";
    systems = [ "aarch64-linux" ];
    supportedFeatures = [ "kvm" "benchmark" "big-parallel" ];
  };
}
