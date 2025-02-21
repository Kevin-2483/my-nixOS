{ config, pkgs, lib, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override {
        extraPkgs = pkgs:
          with pkgs;
          [
            # keyutils
            # libkrb5
            # libpng
            # libpulseaudio
            # libvorbis
            # stdenv.cc.cc.lib
            # xorg.libXcursor
            # xorg.libXi
            # xorg.libXinerama
            # xorg.libXScrnSaver
            liberation_ttf

          ];
        # extraProfile = "export GDK_SCALE=2";
      };
    })

  ];
}

