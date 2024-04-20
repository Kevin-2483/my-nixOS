{ config, lib, pkgs, username, ... }:
{
	system.activationScripts.symlinks = {
    	text =
    		''
    		mkdir /home/${username}/.config/nvim
    		mkdir /home/${username}/.config/fcitx5
    		ln -sf /etc/nixos/dotfile/micro /home/${username}/.config/micro
    		ln -sf /etc/nixos/dotfile/yazi /home/${username}/.config/yazi
    		ln -sf /etc/nixos/dotfile/fcitx5/conf /home/${username}/.config/fcitx5/conf
    		ln -sf /etc/nixos/dotfile/fcitx5/config /home/${username}/.config/fcitx5/config
    		ln -sf /etc/nixos/dotfile/fcitx5/profile /home/${username}/.config/fcitx5/profile
    		ln -sf /etc/nixos/dotfile/fcitx5/themes /home/${username}/.local/share/fcitx5/themes
    		ln -sf /etc/nixos/dotfile/fcitx5/default.custom.yaml /home/${username}/.local/share/fcitx5/rime/default.custom.yaml
    		ln -sf /etc/nixos/dotfile/fcitx5/double_pinyin_mspy.schema.yaml /home/${username}/.local/share/fcitx5/rime/build/double_pinyin_mspy.schema.yaml
    		
    		ln -sf /etc/nixos/dotfile/nvim/lua /home/${username}/.config/nvim/lua
    		ln -sf /etc/nixos/dotfile/nvim/init.lua /home/${username}/.config/nvim/init.lua
    		'';
    	};
}
