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
  font = {
    package = nerdfonts;
  };
in
{
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      font.package
    ];
  };
  catppuccin.flavor = "mocha";
}
