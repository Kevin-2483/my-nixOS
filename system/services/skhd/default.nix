{ lib, pkgs, ... }:
{
  services.skhd = {
    enable = false;
    package = pkgs.skhd;
    skhdConfig = ''
    # focus window
    ctrl + cmd - h : yabai -m window --focus west
    ctrl + cmd - j : yabai -m window --focus south
    ctrl + cmd - k : yabai -m window --focus north
    ctrl + cmd - l : yabai -m window --focus east

    # move by direction
    ctrl + alt - h : yabai -m window --swap west
    ctrl + alt - j : yabai -m window --swap south
    ctrl + alt - k : yabai -m window --swap north
    ctrl + alt - l : yabai -m window --swap east

    alt - up : yabai -m display --focus prev || yabai -m display --focus last
    alt - down : yabai -m display --focus next || yabai -m display --focus first

    alt - left : yabai -m space --focus prev || yabai -m space --focus last
    alt - right : yabai -m space --focus next || yabai -m space --focus first
    alt - 1 : yabai -m space --focus 1
    alt - 2 : yabai -m space --focus 2
    alt - 3 : yabai -m space --focus 3
    alt - 4 : yabai -m space --focus 4
    alt - 5 : yabai -m space --focus 5
    alt - 6 : yabai -m space --focus 6
    alt - 7 : yabai -m space --focus 7
    alt - 8 : yabai -m space --focus 8
    alt - 9 : yabai -m space --focus 9
    alt - 0 : yabai -m space --focus 10
    alt - = : yabai -m space --create
    alt - - : yabai -m space --destroy
    alt - [ : yabai -m space --move prev
    alt - ] : yabai -m space --move next

    alt - b : yabai -m space --balance
    # yabai -m space --mirror x-axis
    # yabai -m space --mirror y-axis
    alt + shift - r : yabai -m space --rotate 90
    alt - r : yabai -m window --toggle split

    # yabai -m space --layout bsp

    ctrl + alt - left : yabai -m window --space prev || yabai -m window --space last
    ctrl + alt - right : yabai -m window --space next || yabai -m window --space first
    alt + shift - 1 : yabai -m window --space 1
    alt + shift - 2 : yabai -m window --space 2
    alt + shift - 3 : yabai -m window --space 3
    alt + shift - 4 : yabai -m window --space 4
    alt + shift - 5 : yabai -m window --space 5
    alt + shift - 6 : yabai -m window --space 6
    alt + shift - 7 : yabai -m window --space 7
    alt + shift - 8 : yabai -m window --space 8
    alt + shift - 9 : yabai -m window --space 9
    alt + shift - 0 : yabai -m window --space 10

    # options: zoom-parent, zoom-fullscreen, native-fullscreen
    alt - z : yabai -m window --toggle zoom-parent
    alt + shift - z : yabai -m window --toggle native-fullscreen

    alt - m : yabai -m window --toggle float

    fn + ctrl - up : yabai -m window --resize top:0:-100
    fn + ctrl - right : yabai -m window --resize right:100:0
    fn + ctrl - down : yabai -m window --resize bottom:0:100
    fn + ctrl - left : yabai -m window --resize left:-100:0

    fn + alt - up : yabai -m window --resize bottom:0:-100
    fn + alt - right : yabai -m window --resize left:100:0
    fn + alt - down : yabai -m window --resize top:0:100
    fn + alt - left : yabai -m window --resize right:-100:0

    fn + cmd - up : yabai -m window --move rel:0:-100
    fn + cmd - down : yabai -m window --move rel:0:100
    fn + cmd - left : yabai -m window --move rel:-100:0   
    fn + cmd - right : yabai -m window --move rel:100:0


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