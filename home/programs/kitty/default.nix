{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    # font.name = "SpaceMono Nerd Font";
    theme = "Catppuccin-Mocha";
    package = pkgs.kitty;
    settings = {
      font_family = "Space Mono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "14";
      disable_ligatures = "cursor";
      shell = "${pkgs.nushell}/bin/nu -e neofetch";
      # shell = ''
      # /run/current-system/sw/bin/bash -c "source /etc/static/bashrc; nu -e neofetch"
      # '';

    };
    keybindings = {
      "ctrl+c" = "copy_to_clipboard";
      "ctrl+v" = "paste_from_clipboard";
      # "right" = "paste_from_clipboard";
      "kitty_mod" = "ctrl+shift";
      "kitty_mod+s" = "pass_selection_to_program firefox";
    };
    extraConfig = ''
      map ctrl+shift+c send_text all \x03
      font_family      SpaceMono Nerd Font
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      macos_option_as_alt yes
    '';
  };
}
