{
	systemd.services.frpc = {
	      enable = true;
	      after = [ "network.target" "syslog.target" ];
	      wants = [ "network.target" ];
	      serviceConfig = {
	      type = "simple";
	      Restart="always";
	      RestartSec = "5s";
	      ExecStart = "/home/kevin/services/frp/frpc -c /home/kevin/services/frp/frpc.toml";
	      };
	      wantedBy = [ "multi-user.target" ];
	    };	
}
