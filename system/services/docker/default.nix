{ lib, pkgs, ... }:
{
  imports = [
    ./portainer
    ./mcsm
  ];
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  virtualisation.docker.daemon.settings = {
    data-root = "/home/docker";
  };
  virtualisation.oci-containers.backend = "docker";
  boot.kernel.sysctl = { "net.ipv4.ip_forward" = 1; };
  systemd.services.promisc = {
    enable = false;
    after = [ "network.target" ];
    serviceConfig = {
      type = "oneshot";
      ExecStartPre = "${pkgs.iproute2}/sbin/ip link set enp2s0 promisc on";
      ExecStart = "${pkgs.iproute2}/sbin/ip link set eno1 promisc on";
    };
    wantedBy = [ "multi-user.target" ];
  };

  # system.activationScripts.macvlan.text = ''
  # 	docker network create -d macvlan --subnet=10.0.0.0/24 --gateway=10.0.0.9 -o parent=eno1 macnet
  #   docker network ls
  #   docker images    
  #   docker run --restart always --name openwrt -d --network macnet --privileged --ip 10.0.0.10 openwrtbackup /sbin/init -v /home/kevin/openwrt:/home/hostfolder
  #   docker ps -a
  #   docker exec -it openwrt bash
  # vim /etc/config/network
  # config interface 'lan'
  # option type 'bridge'
  # option ifname 'eth0'
  # option proto 'static'
  # option netmask '255.255.255.0'
  # option ip6assign '60'
  # option ipaddr '10.0.0.10'
  # option gateway '10.0.0.1'
  # option broadcast '10.0.0.255'
  # option dns '255.3.3.3'
  # /etc/init.d/network restart
  # nmcli connection add type macvlan dev eno1 mode bridge ifname OpenWrtBridge autoconnect yes save yes
  # 	'';
}
