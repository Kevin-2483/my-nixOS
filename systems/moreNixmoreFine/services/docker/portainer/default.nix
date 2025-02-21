{
  virtualisation.oci-containers.containers = {
    portainer = {
      image = "portainer/portainer-ee:2.21.5";
      autoStart = true;
      ports = [
        "8000:8000"
        "9443:9443"
      ];
      volumes = [
        "/var/run/docker.sock:/var/run/docker.sock"
        "/home/kevin/services/docker/portainer/data:/data"
      ];
      extraOptions = [
        # "--restart=unless-stopped"
      ];
    };
    portainer_agent = {
      image = "portainer/agent:2.21.5";
      autoStart = true;
      ports = [
        "9001:9001"
      ];
      volumes = [
        "/var/run/docker.sock:/var/run/docker.sock"
        "/var/lib/docker/volumes:/var/lib/docker/volumes"
        "/:/host"
      ];
      extraOptions = [
        # "--restart=always"
      ];
    };
  };
}
