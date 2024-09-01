{ lib, pkgs, ... }:
{
  services.skhd = {
    enable = false;
    package = pkgs.skhd;
    skhdConfig = ''
    # focus window
    ctrl + cmd - h : /run/current-system/sw/bin/yabai -m window --focus west
    ctrl + cmd - j : /run/current-system/sw/bin/yabai -m window --focus south
    ctrl + cmd - k : /run/current-system/sw/bin/yabai -m window --focus north
    ctrl + cmd - l : /run/current-system/sw/bin/yabai -m window --focus east

    # move by direction
    ctrl + alt - h : /run/current-system/sw/bin/yabai -m window --swap west
    ctrl + alt - j : /run/current-system/sw/bin/yabai -m window --swap south
    ctrl + alt - k : /run/current-system/sw/bin/yabai -m window --swap north
    ctrl + alt - l : /run/current-system/sw/bin/yabai -m window --swap east

    alt - up : /run/current-system/sw/bin/yabai -m display --focus prev || /run/current-system/sw/bin/yabai -m display --focus last
    alt - down : /run/current-system/sw/bin/yabai -m display --focus next || /run/current-system/sw/bin/yabai -m display --focus first

    alt - left : /run/current-system/sw/bin/yabai -m space --focus prev || /run/current-system/sw/bin/yabai -m space --focus last
    alt - right : /run/current-system/sw/bin/yabai -m space --focus next || /run/current-system/sw/bin/yabai -m space --focus first
    alt - 1 : /run/current-system/sw/bin/yabai -m space --focus 1
    alt - 2 : /run/current-system/sw/bin/yabai -m space --focus 2
    alt - 3 : /run/current-system/sw/bin/yabai -m space --focus 3
    alt - 4 : /run/current-system/sw/bin/yabai -m space --focus 4
    alt - 5 : /run/current-system/sw/bin/yabai -m space --focus 5
    alt - 6 : /run/current-system/sw/bin/yabai -m space --focus 6
    alt - 7 : /run/current-system/sw/bin/yabai -m space --focus 7
    alt - 8 : /run/current-system/sw/bin/yabai -m space --focus 8
    alt - 9 : /run/current-system/sw/bin/yabai -m space --focus 9
    alt - 0 : /run/current-system/sw/bin/yabai -m space --focus 10
    alt - = : /run/current-system/sw/bin/yabai -m space --create
    alt - - : /run/current-system/sw/bin/yabai -m space --destroy
    alt - [ : /run/current-system/sw/bin/yabai -m space --move prev
    alt - ] : /run/current-system/sw/bin/yabai -m space --move next

    alt - b : /run/current-system/sw/bin/yabai -m space --balance
    # /run/current-system/sw/bin/yabai -m space --mirror x-axis
    # /run/current-system/sw/bin/yabai -m space --mirror y-axis
    alt + shift - r : /run/current-system/sw/bin/yabai -m space --rotate 90
    alt - r : /run/current-system/sw/bin/yabai -m window --toggle split

    # /run/current-system/sw/bin/yabai -m space --layout bsp

    ctrl + alt - left : /run/current-system/sw/bin/yabai -m window --space prev || /run/current-system/sw/bin/yabai -m window --space last
    ctrl + alt - right : /run/current-system/sw/bin/yabai -m window --space next || /run/current-system/sw/bin/yabai -m window --space first
    alt + shift - 1 : /run/current-system/sw/bin/yabai -m window --space 1
    alt + shift - 2 : /run/current-system/sw/bin/yabai -m window --space 2
    alt + shift - 3 : /run/current-system/sw/bin/yabai -m window --space 3
    alt + shift - 4 : /run/current-system/sw/bin/yabai -m window --space 4
    alt + shift - 5 : /run/current-system/sw/bin/yabai -m window --space 5
    alt + shift - 6 : /run/current-system/sw/bin/yabai -m window --space 6
    alt + shift - 7 : /run/current-system/sw/bin/yabai -m window --space 7
    alt + shift - 8 : /run/current-system/sw/bin/yabai -m window --space 8
    alt + shift - 9 : /run/current-system/sw/bin/yabai -m window --space 9
    alt + shift - 0 : /run/current-system/sw/bin/yabai -m window --space 10

    # options: zoom-parent, zoom-fullscreen, native-fullscreen
    alt - z : /run/current-system/sw/bin/yabai -m window --toggle zoom-parent
    alt + shift - z : /run/current-system/sw/bin/yabai -m window --toggle native-fullscreen

    alt - m : /run/current-system/sw/bin/yabai -m window --toggle float

    fn + ctrl - up : /run/current-system/sw/bin/yabai -m window --resize top:0:-100
    fn + ctrl - right : /run/current-system/sw/bin/yabai -m window --resize right:100:0
    fn + ctrl - down : /run/current-system/sw/bin/yabai -m window --resize bottom:0:100
    fn + ctrl - left : /run/current-system/sw/bin/yabai -m window --resize left:-100:0

    fn + alt - up : /run/current-system/sw/bin/yabai -m window --resize bottom:0:-100
    fn + alt - right : /run/current-system/sw/bin/yabai -m window --resize left:100:0
    fn + alt - down : /run/current-system/sw/bin/yabai -m window --resize top:0:100
    fn + alt - left : /run/current-system/sw/bin/yabai -m window --resize right:-100:0

    fn + cmd - up : /run/current-system/sw/bin/yabai -m window --move rel:0:-100
    fn + cmd - down : /run/current-system/sw/bin/yabai -m window --move rel:0:100
    fn + cmd - left : /run/current-system/sw/bin/yabai -m window --move rel:-100:0   
    fn + cmd - right : /run/current-system/sw/bin/yabai -m window --move rel:100:0


    alt - a : open -a arc
    alt - s : open -a spotify
    alt - return : kitty
    alt - c : code
    alt - f : open -a Finder
    alt - w : open -a wechat
    alt - l : LocalSend
    alt - o : open -a obsidian
    alt - t : open -a WezTerm
    alt - x : kitty nu -e yy
    alt - u : open -a "System Settings"
    alt - j : open -a Calculator
    '';
  };
}