{
  programs.hyprlock = {
    enable = true;
    # GENERAL
    general = {
        disable_loading_bar = true;
        hide_cursor = true;
    };
    sources = [ "$HOME/.config/hypr/mocha.conf" ];

    extraConfig = ''
    $font = SpaceMono Nerd Font
    # TIME
    label {
        monitor =
        text = cmd[update:30000] echo "$(date +"%R")"
        color = $text
        font_size = 90
        font_family = $font
        position = -30, 0
        halign = right
        valign = top
    }

    # DATE 
    label {
        monitor = 
        text = cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"
        color = $text
        font_size = 25
        font_family = $font
        position = -30, -150
        halign = right
        valign = top
    }

    # USER AVATAR

    image {
        monitor = 
        path = ~/.face.png
        size = 400
        border_color = $mauve

        position = 0, 75
        halign = center
        valign = center
    }
    '';
    # BACKGROUND
    backgrounds = [
      {
        path = "~/.config/background.png";
        blur_passes = 1;
        color = "$base";
      }
    ]; 
   


    input-fields = [
      {
        # monitor = "str";
        size = { width = 300; height = 60; };        
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$mauve";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = false;
        placeholder_text = "<span foreground=\"##$textAlpha\"><i>󰌾 Logged in as </i><span foreground=\"##$mauveAlpha\">$USER</span></span>";
        hide_input = false;
        check_color = "$mauve";
        fail_color = "$red";
        fail_text = ''
          <i>$FAIL <b>($ATTEMPTS)</b></i>
          '';
        capslock_color = "$yellow";
        numlock_color = "$pink";
        position = { x = 0; y = -235; };
        halign = "center";
        valign = "center";
      }
    ];
  };
}
