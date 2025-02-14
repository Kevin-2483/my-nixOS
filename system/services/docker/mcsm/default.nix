{
  virtualisation.oci-containers.containers."mcsm-daemon" = {
    image = "githubyumao/mcsmanager-daemon:latest";
    autoStart = true;
    environment = {
      "MCSM_DOCKER_WORKSPACE_PATH" = "/home/kevin/services/docker/mcsm/daemon/data/InstanceData";
    };
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/home/kevin/services/docker/mcsm/daemon/data:/opt/mcsmanager/daemon/data:rw"
      "/home/kevin/services/docker/mcsm/daemon/logs:/opt/mcsmanager/daemon/logs:rw"
      "/var/run/docker.sock:/var/run/docker.sock:rw"
    ];
    ports = [
      "24444:24444/tcp"
    ];
    log-driver = "journald";
  };
  virtualisation.oci-containers.containers."mcsm-web" = {
    image = "githubyumao/mcsmanager-web:latest";
    autoStart = true;
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/home/kevin/services/docker/mcsm/web/data:/opt/mcsmanager/web/data:rw"
      "/home/kevin/services/docker/mcsm/web/logs:/opt/mcsmanager/web/logs:rw"
    ];
    ports = [
      "23333:23333/tcp"
    ];
    log-driver = "journald";
  }
}