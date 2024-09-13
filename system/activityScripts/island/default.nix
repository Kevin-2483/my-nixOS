{ pkgs, ... }:
{
  system.activityScripts.island = {
    enable = true;
    source = "${pkgs.sketchybar}/bin/sketchybar";
    target = "/run/current-system/sw/bin/dynamic-island-sketchybar";
  };
}