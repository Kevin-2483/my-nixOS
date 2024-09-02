{
  homebrew.enable = true;
  homebrew.taps = [
    {
      name = "FelixKratz/formulae";
      # force_auto_update = true;
      # clone_target
    }
  ];
  homebrew.brews = [
    {
      name = "borders";
      start_service = true;
      restart_service = "changed";
    }
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
  ];
}
