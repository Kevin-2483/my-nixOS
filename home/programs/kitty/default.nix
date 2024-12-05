{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    # font.name = "SpaceMono Nerd Font";
    themeFile = "Catppuccin-Mocha";
    package = pkgs.master.kitty;
    settings = {
      font_family = "Space Mono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "14";
      disable_ligatures = "cursor";
      shell = "${pkgs.nushell}/bin/nu -l -e neofetch";
      # shell = ''
      # /run/current-system/sw/bin/bash -c "source /etc/static/bashrc; nu -e neofetch"
      # '';

    };
    keybindings = {
      # "ctrl+c" = "copy_to_clipboard";
      # "ctrl+v" = "paste_from_clipboard";
      # "right" = "paste_from_clipboard";
      "kitty_mod" = "ctrl+shift";
      "kitty_mod+s" = "pass_selection_to_program firefox";
    };
    # map ctrl+shift+c send_text all \x03
    extraConfig = ''
      font_family      SpaceMono Nerd Font
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      disable_ligatures cursor
      hide_window_decorations        titlebar-only
      window_padding_width           15
      background_opacity             0.8
      background_blur                64
      remember_window_size           yes
      tab_bar_edge                top
      tab_bar_style               powerline
      tab_powerline_style         round
      macos_option_as_alt yes
      map cmd+1 combine : send_key ctrl+space : send_key 1
      map cmd+2 combine : send_key ctrl+space : send_key 2
      map cmd+3 combine : send_key ctrl+space : send_key 3
      map cmd+4 combine : send_key ctrl+space : send_key 4
      map cmd+5 combine : send_key ctrl+space : send_key 5
      map cmd+6 combine : send_key ctrl+space : send_key 6
      map cmd+7 combine : send_key ctrl+space : send_key 7
      map cmd+8 combine : send_key ctrl+space : send_key 8
      map cmd+9 combine : send_key ctrl+space : send_key 9
      mouse_hide_wait 0.5
      enable_cursor_trail yes
      cursor_trail 10

    '';
  };
}
