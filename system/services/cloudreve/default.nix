{
	systemd.services.cloudreve = {
	      enable = true;
	      after = [ "network.target" "mysqld.service" ];
	      wants = [ "network.target" ];
	      serviceConfig = {
	      WorkingDirectory=/home/kevin/cloudreve;
	      ExecStart = /home/kevin/cloudreve/cloudreve;
	      Restart="on-abnormal";
	      RestartSec = "5s";
	      KillMode="mixed";
	      StandardOutput=null;
	      StandardError="syslog";
	      };
	      wantedBy = [ "multi-user.target" ];
	    };	
}
