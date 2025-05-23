{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    loadInNixShell = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    silent = false; # 是否可以隐藏Direnv Logging。
    direnvrcExtra = '''';
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
}
