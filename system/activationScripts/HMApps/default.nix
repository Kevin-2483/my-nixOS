{ pkgs, username ... }:
{
  system.activationScripts.hmapps = {
    enable = true;
    # copy = true;
    source = "/Users/${username}/Applications/Home Manager Apps/*.app";
    target = /Applications;
  };
}
