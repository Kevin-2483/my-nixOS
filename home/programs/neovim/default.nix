{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = false;
    viAlias = false;
    # configure = {};
  };
}
