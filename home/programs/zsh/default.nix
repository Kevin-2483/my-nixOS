{ config, pkgs, lib, ... }:

{

  programs.zsh = {
  		enable = true;
  		autocd = true;
  		enableCompletion = true;
  	    syntaxHighlighting.enable = true;
  		oh-my-zsh={
  			theme = "frisk";
  			plugins = [
  				"fzf"
  				"zsh-interactive-cd"
  				"autojump"
  				"copyfile"
  				"copypath"
  				"cp"
  				"history"
  				"sudo"
  			];
  			# package = pkgs.oh-my-zsh;
  			enable = true;
  			# custom = null;
  		};

  		initExtra = ''
  		function yy() {
  			local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  			yazi "$@" --cwd-file="$tmp"
  			if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
  				cd -- "$cwd"
  			fi
  			rm -f -- "$tmp"
  		}
  		
  		'';
  		
  		# TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
  		    shellAliases = {
  		      pc4 = "proxychains4";
  		      # urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
  		      # urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  		    };
  	};
}
