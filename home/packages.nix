{ inputs, config, pkgs, outputs, lib, ... }:

{
  
  home.packages = with pkgs;[
    # 如下是我常用的一些命令行工具，你可以根据自己的需要进行增删
    neofetch
    # nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    # ripgrep # recursively searches directories for a regex pattern
    # jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processer https://github.com/mikefarah/yq
    # eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    #clash-verge
    #clash-verge-rev
    # clash-geoip
    
    

    # misc
    # cowsay
    # file
    # which
    # tree
    # gnused
    # gnutar
    # gawk
    # zstd
    # gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    # hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    nvitop

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    autojump
    foot
    microsoft-edge

    vscode-fhs
    proxychains-ng
    micro
    go-musicfox
    qq
    unstable.teamspeak5_client


    
    #ydotool #通用 Linux 命令行自动化工具
    #slurp #在 Wayland 合成器中选择一个区域
    #gojq # 轻量级且灵活的命令行 JSON 处理器
    #wl-clipboard #Wayland 的命令行复制/粘贴实用程序
    #wf-recorder # 用于基于 wlroots 的合成器的屏幕录制的实用程序
    grim #从 Wayland 合成器中获取图像
    #pywal #动态生成和更改配色方案
    #wayshot #一个原生的、极快的屏幕截图工具，适用于基于 wlroots 的合成器（例如 sway 和 River）
    #swappy #Wayland 原生快照编辑工具，灵感来自 macOS 上的 Snappy
    
    yad # 用于 shell 脚本的 GUI 对话框工具
    (python3.withPackages (ps: with ps; [ python311Packages.material-color-utilities ]))
    gradience  #自定义 libadwaita 和 GTK3 应用程序（使用 adw-gtk3）
    fuzzel #Wayland原生应用程序启动器，类似于rofi的drun模式
    #bun #令人难以置信的快速 JavaScript 运行时、捆绑器、转译器和包管理器 – 全部合而为一

    #brightnessctl
    #fd
    #dart-sass
    #swww
    #inputs.matugen.packages."x86_64-linux".default
    #hyprpicker
    #pavucontrol
    obsidian
    (mpv.override { scripts = [mpvScripts.mpris]; })
    spotify
    github-desktop
    icon-library

    steam-run
    steam
    libnotify
    slides
    #helix
    feh
    nsxiv
    obs-studio
    googler
    hmcl
  ];

  nixpkgs = {
        overlays = [
          # Add overlays your own flake exports (from overlays and pkgs dir):
          outputs.overlays.unstable-packages
          #outputs.overlays.steam-env
        ];
        config = {
              allowUnfree = true;
              # Workaround for https://github.com/nix-community/home-manager/issues/2942
              allowUnfreePredicate = _: true;
            };
        };
  

}
