{ pkgs, ... }: {
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    envFile = {
      text = ''
        			$env.__NIX_DARWIN_SET_ENVIRONMENT_DONE = 1

        			$env.LC_CTYPE = "en_US.UTF-8"

        			$env.PATH = [
        					$"($env.HOME)/.cargo/bin"
        					$"($env.HOME)/.nix-profile/bin"
        					$"/etc/profiles/per-user/($env.USER)/bin"
        					"/run/current-system/sw/bin"
        					"/nix/var/nix/profiles/default/bin"
        					"/usr/local/bin"
        					"/usr/bin"
        					"/usr/sbin"
        					"/bin"
        					"/sbin"
        					"/opt/homebrew/bin"
        			]
        			$env.EDITOR = "lvim"
        			$env.NIX_PATH = $"darwin-config=($env.HOME)/.config/nix-darwin/flake.nix:/nix/var/nix/profiles/per-user/root/channels"
        			$env.NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt"
        			$env.PAGER = "less -R"
        			$env.TERMINFO_DIRS = [
        					$"($env.HOME)/.nix-profile/share/terminfo"
        					$"/etc/profiles/per-user/($env.USER)/share/terminfo"
        					"/run/current-system/sw/share/terminfo"
        					"/nix/var/nix/profiles/default/share/terminfo"
        					"/usr/share/terminfo"
        			]
        			$env.XDG_CONFIG_DIRS = [
        					$"($env.HOME)/.nix-profile/etc/xdg"
        					$"/etc/profiles/per-user/($env.USER)/etc/xdg"
        					"/run/current-system/sw/etc/xdg"
        					"/nix/var/nix/profiles/default/etc/xdg"
        			]
        			$env.XDG_DATA_DIRS = [
        					$"($env.HOME)/.nix-profile/share"
        					$"/etc/profiles/per-user/($env.USER)/share"
        					"/run/current-system/sw/share"
        					"/nix/var/nix/profiles/default/share"
        			]
        			$env.TERM = $env.TERM
        			$env.NIX_USER_PROFILE_DIR = $"/nix/var/nix/profiles/per-user/($env.USER)"
        			$env.NIX_PROFILES = [
        					"/nix/var/nix/profiles/default"
        					"/run/current-system/sw"
        					$"/etc/profiles/per-user/($env.USER)"
        					$"($env.HOME)/.nix-profile"
        			]

        			if ($"($env.HOME)/.nix-defexpr/channels" | path exists) {
        					$env.NIX_PATH = ($env.NIX_PATH | split row (char esep) | append $"($env.HOME)/.nix-defexpr/channels")
        			}

        			if (false in (ls -l `/nix/var/nix`| where type == dir | where name == "/nix/var/nix/db" | get mode | str contains "w")) {
        					$env.NIX_REMOTE = "daemon"
        			}

        			mkdir ~/.cache/starship
        			starship init nu | save -f ~/.cache/starship/init.nu

              $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
              mkdir ~/.cache/carapace
              carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
              $env.config = {
                edit_mode: vi
              }
        			'';
    };
    configFile = {
      text = ''
              def install_plugins [] {
                [
                  # nu_plugin_polars
                  nu_plugin_gstat
                  nu_plugin_formats
                  nu_plugin_query
                  nu_plugin_net
                  nu_plugin_bash_env
                  nu_plugin_clipboard
                  nu_plugin_dns
                  nu_plugin_emoji
                  nu_plugin_image
                  nu_plugin_port_list
                  nu_plugin_port_scan
                ] | each { |it|  
                      # 尝试安装插件，忽略失败的情况
                      try {
                        cargo install $it | ignore
                      } catch {
                        echo "Failed to install it"
                      }
                } | ignore
                [
                  # nu_plugin_polars
                  nu_plugin_gstat
                  nu_plugin_formats
                  nu_plugin_query
                  nu_plugin_net
                  nu_plugin_bash_env
                  nu_plugin_clipboard
                  nu_plugin_dns
                  nu_plugin_emoji
                  nu_plugin_image
                  nu_plugin_port_list
                  nu_plugin_port_scan
                ] | each { |it|  
                      # 尝试安装插件，忽略失败的情况
                      try {
                        plugin add $"($env.HOME)/.cargo/bin/($it)" | ignore
                      } catch {
                        echo "Failed to install it"
                      }
                }
              }
        			# use ~/.cache/starship/init.nu
        			# def --env yy [...args] {
        			# let tmp = (mktemp -t "yazi-cwd.XXXXXX")
        			# yazi ...$args --cwd-file $tmp
        			# let cwd = (open $tmp)
        			# if $cwd != "" and $cwd != $env.PWD {
        			# 		cd $cwd
        			# 	}
        			# 	rm -fp $tmp
        			# }
        			$env.config = {
        			  show_banner: false,
        			}
        			# def nupen [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
        			# alias open = ^open

        			def "cargo search" [ query: string, --limit=10] {
        					^cargo search $query --limit $limit
        					| lines
        					| each {
        							|line| if ($line | str contains "#") {
        									$line | parse --regex '(?P<name>.+) = "(?P<version>.+)" +# (?P<description>.+)'
        							} else {
        									$line | parse --regex '(?P<name>.+) = "(?P<version>.+)"'
        							}
        					}
        					| flatten
        			}
        			'';
    };
    shellAliases = {
      pc4 = "proxychains4";
      vi = "lvim";
      vim = "lvim";
    };

  };
}
