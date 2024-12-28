{ lib, pkgs, ... }: {
  services.skhd = {
    enable = true;
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
      alt - 0x18 : yabai -m space --create
      alt - 0x1B : yabai -m space --destroy
      alt - 0x21 : yabai -m space --move prev
      alt - 0x1E : yabai -m space --move next
      alt - 0x32 : yabai -m space --focus recent

      alt + cmd - b : yabai -m space --balance
      # yabai -m space --mirror x-axis
      # yabai -m space --mirror y-axis
      alt + shift - r : yabai -m space --rotate 90
      alt + cmd - r : yabai -m window --toggle split

      # yabai -m space --layout bsp

      alt + shift - left : yabai -m window --space prev || yabai -m window --space last
      alt + shift - right : yabai -m window --space next || yabai -m window --space first
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
      alt + cmd - z : yabai -m window --toggle zoom-parent
      alt + shift - z : yabai -m window --toggle native-fullscreen

      alt + cmd - m : yabai -m window --toggle float

      ctrl - up : yabai -m window --resize top:0:-100
      ctrl - right : yabai -m window --resize right:100:0
      ctrl - down : yabai -m window --resize bottom:0:100
      ctrl - left : yabai -m window --resize left:-100:0

      ctrl + shift - up : yabai -m window --resize bottom:0:-100
      ctrl + shift - right : yabai -m window --resize left:100:0
      ctrl + shift - down : yabai -m window --resize top:0:100
      ctrl + shift - left : yabai -m window --resize right:-100:0

      cmd + shift - up : yabai -m window --move rel:0:-100
      cmd + shift - down : yabai -m window --move rel:0:100
      cmd + shift - left : yabai -m window --move rel:-100:0
      cmd + shift - right : yabai -m window --move rel:100:0


      alt - a : open -a arc
      alt - s : open -a spotify
      alt - m : open -a QQMusic
      alt - t : open -a Ghostty
      alt - c : code
      alt - f : open -a Finder
      alt - w : open -a wechat
      alt - l : LocalSend
      alt - o : open -a obsidian
      alt - return : open -a kitty
      alt - x : kny & sleep 0.5 && yabai -m window --focus $(yabai -m query --windows | jq '.[0] | select(.app == "kitty" and .title == "Yazi: ~/") | .id | tonumber')
      # alt - u : open -a "System Settings"
      alt - j : open -a Calculator
      alt - z : zed
    '';
  };
}
