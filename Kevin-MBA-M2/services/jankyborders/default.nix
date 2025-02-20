{ pkgs, ... }: {
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
    hidpi = true;
    ax_focus = false;
    style = "round";
    order = "above";
    width = 15.0;
    whitelist = [ ];
    blacklist = [
      "Mihomo Party"
      "Shottr"
      "崩壞:星穹鐵道"
      "絕區零"
    ];
    blur_radius = 5.0;
    active_color = "0xffF8BBD0";
    inactive_color = "0xff90CAF9";
    background_color = "0xff000000";
  };
}
