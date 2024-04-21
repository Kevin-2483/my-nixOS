{ pkgs, ... }:
let
  nerdfonts = (pkgs.nerdfonts.override { fonts = [
    "Ubuntu"
    "UbuntuMono"
    "CascadiaCode"
    "ComicShannsMono"
    "FantasqueSansMono"
    "FiraCode"
    "Mononoki"
    "SpaceMono"
  ]; });

  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  font = {
    name = "Ubuntu Nerd Font";
    package = nerdfonts;
  };
  cursorTheme = {
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
  };
  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };
in
{
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      theme.package
      font.package
      cursorTheme.package
      iconTheme.package
      gnome.adwaita-icon-theme
      papirus-icon-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = "${toString cursorTheme.size}";
    };
    pointerCursor = cursorTheme // {
      gtk.enable = true;
    };
    # file = {
    #   ".local/share/themes/${theme.name}" = {
    #     source = "${theme.package}/share/themes/${theme.name}";
    #   };
    #   ".config/gtk-4.0/gtk.css".text = ''
    #     window.messagedialog .response-area > button,
    #     window.dialog.message .dialog-action-area > button,
    #     .background.csd{
    #       border-radius: 0;
    #     }
    #   '';
    # };
  };

  fonts.fontconfig.enable = true;
  gtk = {
    inherit font cursorTheme iconTheme;
    # theme.name = theme.name;
    catppuccin.enable = true;
    enable = true;
    # gtk3.extraConfig = {
    # gtk-application-prefer-dark-theme=1;
    # };
    # gtk4.extraConfig = {
    # gtk-application-prefer-dark-theme=1;
    # };
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';
  };
  catppuccin.flavour = "mocha";
  qt = {
    enable = true;
    platformTheme = "kde";
  };
}
