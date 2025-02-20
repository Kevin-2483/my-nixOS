{
  systemd.services.cloudreve = {
    enable = true;
    after = [ "network.target" "mysqld.service" ];
    wants = [ "network.target" ];
    serviceConfig = {
      WorkingDirectory = /home/kevin/services/cloudreve;
      ExecStart = /home/kevin/services/cloudreve/cloudreve;
      Restart = "on-abnormal";
      RestartSec = "5s";
      KillMode = "mixed";
      StandardOutput = null;
      StandardError = "syslog";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
