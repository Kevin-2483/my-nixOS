{ pkgs, ... }:
{
    launchd.daemons.easytier = {
        command = "${pkgs.easytier}/bin/easytier-core -c /Users/kevin/.config/easytier/config.toml";
    };
}
