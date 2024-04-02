{
	systemd.services.frpc = {
	      enable = true;
	      after = [ "network.target" "syslog.target" ];
	      wants = [ "network.target" ];
	      serviceConfig = {
	      type = "simple";
	      ExecStart = "/etc/nixos/system/services/frpc/frp/frpc -c /etc/nixos/system/services/frpc/frp/frpc.toml";
	      };
	      wantedBy = [ "multi-user.target" ];
	    };	
}
