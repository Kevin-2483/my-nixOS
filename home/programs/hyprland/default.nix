{ username, inputs, pkgs, config, lib, ... }:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  plugins = inputs.hyprland-plugins.packages.${pkgs.system};

  yt = pkgs.writeShellScript "yt" ''
    notify-send "Opening video" "$(wl-paste)"
    mpv "$(wl-paste)"
  '';

  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
in
{
  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };
  # config = lib.mkIf (config.specialisation != {}) {
  #         # Config that should only apply to the default system, not the specialised ones
  # 	wayland.windowManager.hyprland.extraConfig = ''
  # 		env = WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0;
  # 	'';
  #   };
        
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    # plugins = with plugins; [ hyprbars borderspp ];
    extraConfig = ''
     # ######### Input method ########## 
     # See https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
     env = QT_IM_MODULE, fcitx
     env = XMODIFIERS, @im=fcitx
     # env = GTK_IM_MODULE, wayland   # Crashes electron apps in xwayland
     # env = GTK_IM_MODULE, fcitx     # My Gtk apps no longer require this to work with fcitx5 hmm  
     env = SDL_IM_MODULE, fcitx
     env = GLFW_IM_MODULE, ibus
     env = INPUT_METHOD, fcitx
     
     # ############ Themes #############
     env = QT_QPA_PLATFORM, wayland
     env = QT_QPA_PLATFORMTHEME, qt5ct
     # env = QT_STYLE_OVERRIDE,kvantum
     env = WLR_NO_HARDWARE_CURSORS, 1
     
     # ######## Screen tearing #########
     # env = WLR_DRM_NO_ATOMIC, 1
     
     # ############ Others #############    

     '';
    settings = {
      exec-once = [
        "ags -b hypr"
        # "swww kill; swww init"
        "tmux new-session -d -s default"
        "hyprctl setcursor Catppuccin-Mocha-Pink-Cursors 24"
        "/home/kevin/.config/runcat/runcat &"
        #"transmission-gtk"
        #"clash-verge"
        "fcitx5"
        "systemctl --user start cliphist"
        "systemctl start --user polkit-gnome-authentication-agent-1"
        #"swww kill; swww init"
        "gnome-keyring-daemon --start --components=secrets"
        # "dbus-update-activation-environment --all"
        # "sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        # "legion_gui --use_legion_cli_to_write"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        ];

      monitor = [
        "eDP-1, 2560x1600@60, 0x0, 1"
        "DP-4, 2560x1440@170, 2560x0, 1"
        # "HDMI-A-1, 2560x1440@170, 2560x0, 1"
        ",preferred,auto,1"
      ];

      general = {
        layout = "dwindle";
        resize_on_border = true;
        no_cursor_warps = true;
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        numlock_by_default = true;
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      binds = {
        allow_workspace_cycles = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        # no_gaps_when_only = "yes";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
        # workspace_swipe_numbered = true;
        workspace_swipe_direction_lock = true;
        workspace_swipe_direction_lock_threshold = 10;
        workspace_swipe_create_new = true;
      };

      windowrule = let
        f = regex: "float, ^(${regex})$";
        s = regex: "size 50% 60%, ^(${regex})$";
        c = regex: "center, ^(${regex})$";
        o = regex: "opacity 0.9 override 0.75 override 1.0 override, ^(${regex})$";
      in [
        (f "org.gnome.Calculator")
        #(f "org.gnome.Nautilus")
        (f "pavucontrol")
        (f "nm-connection-editor")
        (f "blueberry.py")
        (f "org.gnome.Settings")
        (s "org.gnome.Settings")
        (c "org.gnome.Settings")        
        (f "foot")
        (s "foot")
        (c "foot")
        (f "org.kde.kdeconnect-indicator")
		    (s "org.kde.kdeconnect-indicator")
        (c "org.kde.kdeconnect-indicator")
        (f "org.gnome.design.Palette")
        (f "Color Picker")
        (f "xdg-desktop-portal")
        (f "xdg-desktop-portal-gnome")
        (f "transmission-gtk")
        (f "com.github.Aylur.ags")
        (o "firefox")
        (o "obsidian")
        (o "foot")
        (o "kitty")
        # "float, size 50% 50%, center, title:btop++"
        # "size 50% 50%, title:btop++"
        # "center, title:btop++"
        "workspace 7, title:Spotify"
      ];

      bind = let
        binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
        mvfocus = binding "SUPER" "movefocus";
        ws = binding "SUPER" "workspace";
        resizeactive = binding "SUPER CTRL" "resizeactive";
        mvactive = binding "SUPER ALT" "moveactive";
        mvtows = binding "SUPER SHIFT" "movetoworkspace";
        e = "exec, ags -b hypr";
        arr = [1 2 3 4 5 6 7 8 9];
      in [
        "CTRL SHIFT SUPER, A,   ${e} quit; ags -b hypr"
        "SUPER, R,        ${e} -t launcher"
        "SUPER, Tab,      ${e} -t overview"
        ",XF86PowerOff,   ${e} -r 'powermenu.shutdown()'"
        ",XF86AudioMute,  ${e} -r 'audiomute.speaker()'"
        ",XF86Launch4,    ${e} -r 'recorder.start()'"
        ",Print,          ${e} -r 'recorder.screenshot()'"
        "SHIFT,Print,     ${e} -r 'recorder.screenshot(true)'"
        "SUPER, Return, exec, foot" # xterm is a symlink, not actually xterm
        "SUPER, W, exec, firefox"
        "CTRL SHIFT SUPER, S, exec, swww kill; swww init"
        "SUPER, T, exec, tmux new-session -d -s default; kitty tmux attach -t default"
        "SUPER, X, exec, kitty --hold nu -e yy"
        "CTRL SHIFT, Escape, exec, foot -T btop++ btop"
        

        # youtube
        ", XF86Launch1,  exec, ${yt}"

        "ALT, Tab, focuscurrentorlast"
        "CTRL ALT, Delete, exit"
        "SUPER, Q, killactive"
        "SUPER ALT, Space, togglefloating"
        "SUPER, F, fullscreen"
        "SUPER ALT, F, fakefullscreen"
        "SUPER, P, togglesplit"
        "SUPER, V, exec, pkill fuzzel || cliphist list | fuzzel --no-fuzzy --dmenu | cliphist decode | wl-copy"
  		"SUPER, I, exec, XDG_CURRENT_DESKTOP=gnome gnome-control-center"

        # "SUPER, mouse:275, workspace, -1"
        # "SUPER, mouse:276, workspace, +1"
        "SUPER ALT, R, exec, ~/.config/ags/scripts/record-script.sh"
        "SUPER ALT SHIFT, R, exec, ~/.config/ags/scripts/record-script.sh --sound"
		"SUPER CTRL, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen"
		"SUPER CLRL SHIFT, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen-sound"
		
        (mvfocus "k" "u")
        (mvfocus "j" "d")
        (mvfocus "l" "r")
        (mvfocus "h" "l")
        (ws "left" "e-1")
        (ws "right" "e+1")
        (ws "mouse:275" "e-1")
        (ws "mouse:276" "e+1")
        (ws "mouse_up" "e+1")
        (ws "mouse_down" "e-1")
        (mvtows "left" "e-1")
        (mvtows "right" "e+1")
        (mvtows "mouse:275" "e-1")
        (mvtows "mouse:276" "e+1")
        (mvtows "mouse_up" "e+1")
        (mvtows "mouse_down" "e-1")
        (resizeactive "k" "0 -20")
        (resizeactive "j" "0 20")
        (resizeactive "l" "20 0")
        (resizeactive "h" "-20 0")
        (mvactive "k" "0 -20")
        (mvactive "j" "0 20")
        (mvactive "l" "20 0")
        (mvactive "h" "-20 0")
      ]
      ++ (map (i: ws (toString i) (toString i)) arr)
      ++ (map (i: mvtows (toString i) (toString i)) arr);

      bindle = [
        ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
        ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
        ",XF86KbdBrightnessUp,   exec, ${brightnessctl} -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, ${brightnessctl} -d asus::kbd_backlight set  1-"
        ",XF86AudioRaiseVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86Calculator,        exec, gnome-calculator"
      ];

      bindl =  [
        ",XF86AudioPlay,    exec, ${playerctl} play-pause"
        ",XF86AudioStop,    exec, ${playerctl} pause"
        ",XF86AudioPause,   exec, ${playerctl} pause"
        ",XF86AudioPrev,    exec, ${playerctl} previous"
        ",XF86AudioNext,    exec, ${playerctl} next"
        ",XF86AudioMicMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];

      decoration = {
        drop_shadow = "yes";
        shadow_range = 8;
        shadow_render_power = 2;
        "col.shadow" = "rgba(00000044)";

        dim_inactive = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
          popups = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      plugin = {
        hyprbars = {
          bar_color = "rgb(2a2a2a)";
          bar_height = 28;
          col_text = "rgba(ffffffdd)";
          bar_text_size = 11;
          bar_text_font = "Ubuntu Nerd Font";

          buttons = {
            button_size = 0;
            "col.maximize" = "rgba(ffffff11)";
            "col.close" = "rgba(ff111133)";
          };
        };
      };
    };
  };
}
