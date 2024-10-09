{ pkgs, ... }:
{
    launchd.daemons.easytier = {
        command = "${pkgs.easytier}/bin/easytier-core -c /Users/kevin/.config/easytier/config.toml";
        serviceConfig = {
            RunAtLoad = true;
            KeepAlive = true;
            StandardErrorPath = "/Users/kevin/.daemonlog/easytier.log";
            StandardOutPath = "/Users/kevin/.daemonlog/easytier.log";
        };
    };
}
