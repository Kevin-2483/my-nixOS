{
  homebrew = {
    enable = true;
    global = {
      # brewfile 是一个用于声明你要管理的软件包、tap、casks 等的列表
      brewfile = true;
      autoUpdate = true;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
    # taps = [
    #   { name = "mihomo-party-org/mihomo-party"; }
    # ];
    # use nix-homebrew taps instead

    # 用于Formula（可执行程序）的安装
    brews = [
      # {
      #   name = "borders";
      #   start_service = true;
      #   restart_service = "changed";
      # }
      { name = "switchaudio-osx"; }
      { name = "tag"; }
      { name = "kew"; }
      # { name = "cava"; }
    ];
    # 用于Cask（图形界面应用）的安装 --cask
    casks = [
      { name = "chatgpt"; }
      { name = "google-drive"; }
      { name = "obsidian"; }
      { name = "obs"; }
      { name = "raycast"; }
      { name = "wechat"; }
      { name = "steam"; }
      { name = "clash-verge-rev"; }
      { name = "visual-studio-code"; }
      { name = "arc"; }
      { name = "parsec"; }
      { name = "moonlight"; }
      { name = "sf-symbols"; }
      { name = "font-sf-pro"; }
      { name = "font-sarasa-nerd"; }
      { name = "qqmusic"; }
      # { name = "background-music"; }
      { name = "squirrel"; }
      { name = "motrix"; }
      { name = "keycastr"; }
      { name = "zed"; }
      { name = "mihomo-party"; }
      { name = "shottr"; }
      { name = "qq"; }
      { name = "telegram"; }
      # { name = "macfuse"; }
      { name = "dingtalk"; }
      { name = "playcover-community"; }
      # { name = "microsoft-edge"; }
      # { name = "zen-browser"; }
      # { name = "cursor"; }
      { name = "orbstack"; }
      { name = "spotify"; }
      { name = "ghostty"; }
      { name = "diffusionbee"; }
      { name = "lm-studio"; }
      { name = "teamspeak-client@beta"; }
      { name = "iina"; }
      { name = "element"; }
      { name = "follow"; }
      { name = "blackhole-2ch"; }
      { name = "rustdesk"; }
      { name = "pot"; }
      { name = "postman"; }
      { name = "Hoppscotch"; }
      { name = "google-chrome"; }
    ];
    masApps = {
      windows-app = 1295203466;
      runcat = 1429033973;
      xcode = 497799835;
    };
  };
}
