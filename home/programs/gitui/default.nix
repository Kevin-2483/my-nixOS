{ pkgs, ... }: {
  programs.gitui = {
    enable = true;
    catppuccin.enable = true;
    package = pkgs.gitui;
    # keyConfig = ''
    #   exit: Some(( code: Char('c'), modifiers: ( bits: 2,),)),
    #   quit: Some(( code: Char('q'), modifiers: ( bits: 0,),)),
    #   exit_popup: Some(( code: Esc, modifiers: ( bits: 0,),)),
    # '';
  };
}
