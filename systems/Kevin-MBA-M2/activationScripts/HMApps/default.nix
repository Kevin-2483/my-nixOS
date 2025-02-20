{ pkgs, username, ... }: {
  system.activationScripts.hmapps = {
    enable = true;
    text = ''
      ln -sfv "/Users/kevin/Applications/Home Manager Apps" "/Applications/Home Manager Apps"
    '';
  };
}
