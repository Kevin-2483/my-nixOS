{ config, pkgs, inputs, ... }:

{

  programs.nautilus-open-any-terminal = {
    enable = false;
    terminal = "foot";
  };
}