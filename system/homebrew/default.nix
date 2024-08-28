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
}