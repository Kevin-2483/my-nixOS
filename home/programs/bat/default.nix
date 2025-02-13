{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    # config = "";
    catppuccin.enable = false;

  };
}
