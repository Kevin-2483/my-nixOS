{ pkgs, ...}:
{
	programs.nushell = {
		enable = true;
		package = pkgs.nushell;
		envFile = { text =
			''
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
			$env.NIX_PATH = $"darwin-config=($env.HOME)/.nixpkgs/darwin-configuration.nix:/nix/var/nix/profiles/per-user/root/channels"
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
					$env.NIX_PATH = ($env.PATH | split row (char esep) | append $"($env.HOME)/.nix-defexpr/channels")
			}

			if (false in (ls -l `/nix/var/nix`| where type == dir | where name == "/nix/var/nix/db" | get mode | str contains "w")) {
					$env.NIX_REMOTE = "daemon"
			}

			mkdir ~/.cache/starship
			starship init nu | save -f ~/.cache/starship/init.nu
			'';
			};
		configFile = {
			text =
			''
			use ~/.cache/starship/init.nu
			def --env yy [...args] {
			let tmp = (mktemp -t "yazi-cwd.XXXXXX")
			yazi ...$args --cwd-file $tmp
			let cwd = (open $tmp)
			if $cwd != "" and $cwd != $env.PWD {
					cd $cwd
				}
				rm -fp $tmp
			}
			$env.config = {
			  show_banner: false,
			}
			def nupen [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
			alias open = ^open

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
