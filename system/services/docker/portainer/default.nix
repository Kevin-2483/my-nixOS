{
  virtualisation.oci-containers.containers = {
    portainer = {
      image = "portainer/portainer-ee:2.21.5";
      ports = [
        "8000:8000"
        "9443:9443"
      ];
      volumes = [
        "/var/run/docker.sock:/var/run/docker.sock"
        "/home/kevin/services/docker/portainer/data:/data"
      ];
      extraOptions = [
        "--restart=always"
      ];
    };
  };
}