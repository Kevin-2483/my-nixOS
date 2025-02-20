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
  catppuccin= {
    bat = {
      enable = true;
      flavor = "mocha";
    };
    fzf = {
      enable = true;
      flavor = "mocha";
    };
    gitui = { 
      enable = true;
      flavor = "mocha";
    };
    yazi = {
      enable = true;
      flavor = "mocha";
    };
    helix = {
      enable = true;
      flavor = "mocha";
    };
    btop = {
      enable = true;
      flavor = "mocha";
    };
    kitty = {
      enable = true;
      flavor = "mocha";
    };
    lazygit = {
      enable = true;
      flavor = "mocha";
    };
    micro = {
      enable = true;
      flavor = "mocha";
      transparent = true;
    };
    zed = {
      enable = true;
      flavor = "mocha";
    };
  };
}
