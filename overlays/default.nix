# ./overlays/default.nix
{ inputs, ... }:

{
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  master-packages = final: _prev: {
    master = import inputs.nixpkgs-master {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  pam-overlay = final: _prev: {
    pam = import ./newpam.nix {
      inherit final;
    };
  };
}
