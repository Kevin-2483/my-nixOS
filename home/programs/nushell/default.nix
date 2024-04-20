{ pkgs, ...}:
{
	programs.nushell = {
		enable = true;
		package = pkgs.nushell;
		envFile = { text =
			''
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
			
			'';
			};
			shellAliases = {
			pc4 = "proxychains4";
			};

	};
}
