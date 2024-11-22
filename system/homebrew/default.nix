{
  homebrew = {
    enable = true;
    taps = [
      {
        name = "FelixKratz/formulae";
        # force_auto_update = true;
        # clone_target
      }
      { name = "laishulu/cask-fonts"; }
      { name = "mihomo-party-org/mihomo-party"; }
    ];
    brews = [
      {
        name = "borders";
        start_service = true;
        restart_service = "changed";
      }
      { name = "switchaudio-osx"; }
      { name = "tag"; }
      { name = "mpv"; }
      { name = "tree"; }
      # { name = "cava"; }
    ];
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
      # { name = "arc"; }
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
      { name = "PlayCover/playcover/playcover-community"; }
      # { name = "microsoft-edge"; }
      { name = "zen-browser"; }
      { name = "cursor"; }
      { name = "orbstack"; }
    ];
    masApps = {
      windows-app = 1295203466;
      runcat = 1429033973;
      xcode = 497799835;
    };
  };
}
