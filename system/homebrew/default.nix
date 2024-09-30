{
  homebrew.enable = true;
  homebrew.taps = [
    {
      name = "FelixKratz/formulae";
      # force_auto_update = true;
      # clone_target
    }
    {
      name = "laishulu/cask-fonts";
    }
  ];
  homebrew.brews = [
    {
      name = "borders";
      start_service = true;
      restart_service = "changed";
    }
    {
      name = "switchaudio-osx";
    }
    {
      name = "tag";
    }
    {
      name = "mpv";
    }
    {
      name = "tree";
    }
    # {
    #   name = "cava";
    # }
  ];
  homebrew.casks = [
    {
      name = "chatgpt";
    }
    {
      name = "google-drive";
    }
    {
      name = "obsidian";
    }
    {
      name = "obs";
    }
    {
      name = "raycast";
    }
    {
      name = "wechat";
    }
    {
      name = "steam";
    }
    {
      name = "clash-verge-rev";
    }
    {
      name = "visual-studio-code";
    }
    {
      name = "arc";
    }
    {
      name = "parsec";
    }
    {
      name = "moonlight";
    }
    {
      name = "sf-symbols";
    }
    {
      name = "font-sf-pro";
    }
    {
      name = "remote-desktop-manager";
    }
    {
      name = "font-sarasa-nerd";
    }
    {
      name = "qqmusic";
    }
    # {
    #   name = "background-music";
    # }
    {
      name = "squirrel";
    }
  ];
}
