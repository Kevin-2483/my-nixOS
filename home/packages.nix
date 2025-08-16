{ pkgs, inputs, outputs, system, ... }:
let
  # 判断当前平台
  isMacOS = system == "x86_64-darwin" || system == "aarch64-darwin";
  isLinux = system == "x86_64-linux" || system == "aarch64-linux";
  # Platform-specific packages
  platformSpecificPackages = with pkgs;
    (if isMacOS then [
      nowplaying-cli
    ] else [ ]) ++
    (if isLinux then [
      mpv
    ] else [ ]);
in
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
    comma
    devenv
    dotnet-sdk_8
    feh
    findutils
    fzf # A command-line fuzzy finder
    ffmpeg_4-full
    glow # markdown previewer in terminal
    go-musicfox
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
    mods
    neofetch
    nix-output-monitor
    nix-prefetch-scripts
    nixpkgs-fmt
    nodejs
    nsxiv
    ouch
    p7zip
    pciutils # lspci
    proxychains-ng
    python313
    python313Packages.pip.out
    (uv.overrideAttrs (oldAttrs: {
    # 编译时包含 uv 和 uvx 两个可执行文件
      cargoBuildFlags = [
        "--bin" "uv"
        "--bin" "uvx"
      ];
    }))
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
    inputs.p2p_file_system.packages.${system}.default
    inputs.drive-sync.packages.${system}.default
  ] ++ platformSpecificPackages;

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
      permittedInsecurePackages = [
        
      ];
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
