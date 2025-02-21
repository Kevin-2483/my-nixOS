{ outputs, pkgs, ... }: {
  launchd.daemons.easytier = {
    command =
      "${pkgs.master.easytier}/bin/easytier-core -c /Users/kevin/.config/easytier/config.toml";
    serviceConfig = {
      RunAtLoad = false;
      KeepAlive = false;
      StandardErrorPath = "/Users/kevin/.daemonlog/easytier.log";
      StandardOutPath = "/Users/kevin/.daemonlog/easytier.log";
    };
  };
  nixpkgs = { overlays = [ outputs.overlays.master-packages ]; };
}
