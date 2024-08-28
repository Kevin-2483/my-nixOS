{ inputs, config, pkgs, outputs, lib, ... }:

{
  
  home.packages = with pkgs;[
    
    neofetch
    zip
    xz
    unzip
    p7zip
    direnv
    
    fzf # A command-line fuzzy finder
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    nix-output-monitor
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iftop # network monitoring

    lsof # list open files

    pciutils # lspci
    findutils
    ripgrep

    autojump


    proxychains-ng
    micro
    go-musicfox

    spotify
    icon-library

    libnotify
    slides
  #  helix
    feh
    nsxiv
    googler
    localsend
    dotnet-sdk_8

    rustup
    nodejs
    arc-browser

    spicetify-cli
    (texlive.combine { inherit (texlive) scheme-medium ctex xecjk tcolorbox environ tikzfill pdfcol; })
    imagemagick

    jankyborders
    
    ];

  nixpkgs = {
        overlays = [
          # Add overlays your own flake exports (from overlays and pkgs dir):
          outputs.overlays.stable-packages
          #outputs.overlays.steam-env
        ];
        config = {
              allowUnfree = true;
              # Workaround for https://github.com/nix-community/home-manager/issues/2942
              allowUnfreePredicate = _: true;
            };
        };
  nixpkgs.config.allowBroken = true;

}
