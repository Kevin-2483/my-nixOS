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
      "/home/kevin/mc:/Game:rw"
    ];
    ports = [
      "24444:24444/tcp"
      "24444:24444/udp"
      "24454:24454/tcp"
      "24454:24454/udp"
      "25565:25565/tcp"
      "25565:25565/udp"
      "25575:25575/tcp"
      "25575:25575/udp"
      "25585:25585/tcp"
      "25585:25585/udp"
      "25595:25595/tcp"
      "25595:25595/udp"
      "7007:7007/tcp"
      "7007:7007/udp"
      "9009:9009/tcp"
      "9009:9009/udp"
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
  };
}
