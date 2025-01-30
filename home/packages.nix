{ pkgs, outputs, ... }:

{

  home.packages = with pkgs; [
    #  helix
    # master.warp-terminal
    # skhd
    # spotify remove to homebrew
    # sshfs
    # wezterm
    (rustup.overrideAttrs (oldAttrs: {
      # 移除特定的二进制文件
      postInstall = oldAttrs.postInstall or "" + ''
        rm $out/bin/rust-analyzer
      '';
    }))
    #(texlive.combine {
    # inherit (texlive)
    #   scheme-medium ctex xecjk tcolorbox environ tikzfill pdfcol;
    #})
    lunarvim
    #(callPackage ./mypackage/tracker {})
    android-tools
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    autojump
    btop # replacement of htop/nmon
    clipboard-jh
    coder
    direnv
    dotnet-sdk_8
    feh
    findutils
    fzf # A command-line fuzzy finder
    ffmpeg_4-full
    glow # markdown previewer in terminal
    go-musicfox
    googler
    graphviz
    icon-library
    iftop # network monitoring
    imagemagick
    jq
    lazygit
    libnotify
    localsend
    lsof # list open files
    lua
    master.easytier
    master.packwiz
    matugen
    mdcat # cat for markdown
    mediainfo
    micro
    mpv
    nix-output-monitor
    nix-prefetch-scripts
    nixpkgs-fmt
    nodejs
    nowplaying-cli
    nsxiv
    ouch
    p7zip
    pciutils # lspci
    proxychains-ng
    rio
    ripgrep
    rust-analyzer
    scrcpy
    slides
    spicetify-cli
    tokei
    tree
    unzip
    vhs
    wallust
    xz
    zip
    neofetch

  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.stable-packages
      outputs.overlays.master-packages
      #outputs.overlays.steam-env
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
      allowBroken = true;
    };
  };
}

# { pkgs, ... }: {
#   environment.systemPackages = [
#     (pkgs.packageA.override {
#       # 排除特定的二进制文件
#       bintools = pkgs.bintools.override {
#         removeReferencesToBinaries = [ "conflicting-binary" ];
#       };
#     })
#     pkgs.packageB
#   ];
# }
