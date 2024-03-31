{ config, lib, pkgs, username, ... }:
{
	system.activationScripts.symlinks = {
    	text =
    		''
    		ln -sf /etc/nixos/dotfile/micro /home/${username}/.config/micro
    		ln -sf /etc/nixos/dotfile/yazi /home/${username}/.config/yazi
    		'';
    	};
}
