{ pkgs, ... }: {
  programs.carapace = {
    enable = true;
    package = pkgs.carapace;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };
}
