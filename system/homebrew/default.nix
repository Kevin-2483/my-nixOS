{
  homebrew.enable = true;
  homebrew.brews.borders = {
    name = "borders";
    start_service = true;
    restart_service = "changed";
  };
}