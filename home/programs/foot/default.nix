{ config, pkgs, lib, ... }:

{

  programs.foot = {
  		package = pkgs.foot;
  		enable = true;
  		server.enable = true;
  		settings = {
  			main = {
  				shell="zsh";
  				term="xterm-256color";
  				
  				title="terminal";
  				
  				font="SpaceMono Nerd Font:size=14";
  				letter-spacing=0;
  				# horizontal-letter-offset=0
  				# vertical-letter-offset=0
  				# underline-offset=<font metrics>
  				# box-drawings-uses-font-glyphs=no
  				dpi-aware="no";
  				
  				# initial-window-size-pixels=700x500  # Or,
  				# initial-window-size-chars=<COLSxROWS>
  				# initial-window-mode=windowed
  				pad="25x25";                          # optionally append 'center'
  				# resize-delay-ms=100
  				
  				# notify=notify-send -a ${app-id} -i ${app-id} ${title} ${body}
  				
  				bold-text-in-bright="no";
  				# word-delimiters=,│`|:"'()[]{}<>
  				# selection-target=primary
  				# workers=<number of logical CPUs>
  				
  			};
  			scrollback={
  				lines = 10000;
  			};
  			# [url]
  			# launch=xdg-open ${url}
  			# label-letters=sadfjklewcmpgh
  			# osc8-underline=url-mode
  			# protocols=http, https, ftp, ftps, file, gemini, gopher
  			# uri-characters=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'
  			cursor = {
  				style="beam";
  				# color=111012 e7e0e5
  				# blink=no
  				beam-thickness=1.5;
  				# underline-thickness=<font underline thickness>
  			};
  			colors = {
  				alpha = 0.7;
  			};
  			# [csd]
  			# preferred=server
  			# size=26
  			# font=<primary font>
  			# color=<foreground color>
  			# button-width=26
  			# button-color=<background color>
  			# button-minimize-color=<regular4>
  			# button-maximize-color=<regular2>
  			# button-close-color=<regular1>
  			key-bindings = {
  				scrollback-up-page="Page_Up";
  				# scrollback-up-half-page=none
  				# scrollback-up-line=none
  				scrollback-down-page="Page_Down";
  				# scrollback-down-half-page=none
  				# scrollback-down-line=none
  				clipboard-copy="Control+c";
  				clipboard-paste="Control+v";
  				# primary-paste=Shift+Insert
  				search-start="Control+f";
  				# font-increase=Control+plus Control+equal Control+KP_Add
  				# font-decrease=Control+minus Control+KP_Subtract
  				# font-reset=Control+0 Control+KP_0
  				# spawn-terminal=Control+Shift+n
  				# minimize=none
  				# maximize=none
  				# fullscreen=none
  				# pipe-visible=[sh -c "xurls | fuzzel | xargs -r firefox"] none
  				# pipe-scrollback=[sh -c "xurls | fuzzel | xargs -r firefox"] none
  				# pipe-selected=[xargs -r firefox] none
  				# show-urls-launch=Control+Shift+u
  				# show-urls-copy=none
  			};
  			search-bindings = {
  				cancel="Escape";
  				find-prev="Control+comma";
  				find-next="Control+period";
  			};
  			# [url-bindings]
  			# cancel=Control+g Control+c Control+d Escape
  			# toggle-url-visible=t
  			
  			# [mouse-bindings]
  			# primary-paste=BTN_MIDDLE
  			# select-begin=BTN_LEFT
  			# select-begin-block=Control+BTN_LEFT
  			# select-extend=BTN_RIGHT
  			# select-extend-character-wise=Control+BTN_RIGHT
  			# select-word=BTN_LEFT-2
  			# select-word-whitespace=Control+BTN_LEFT-2
  			# select-row=BTN_LEFT-3
  			
  		};
  	};
}
