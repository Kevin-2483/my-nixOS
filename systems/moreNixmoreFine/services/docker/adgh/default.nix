{
  virtualisation.oci-containers.containers = {
    adgh = {
      image = "adguard/adguardhome:latest";
      autoStart = true;
      ports = [
        "3000:3000"
        "53:53/tcp"
        "53:53/udp"
      ];
      volumes = [
        "/home/kevin/services/docker/adgh/work:/opt/adguardhome/work"
        "/home/kevin/services/docker/adgh/conf:/opt/adguardhome/conf"
      ];
      extraOptions = [
        # "--restart=unless-stopped"
      ];
    };
  };
}