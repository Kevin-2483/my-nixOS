{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.zed-mono
      nerd-fonts.comic-shanns-mono
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.fira-code
      nerd-fonts.mononoki
      nerd-fonts.space-mono
      nerd-fonts.jetbrains-mono

    ];
  };
  catppuccin.flavor = "mocha";
}
