{ pkgs, ... }: {
  programs.pandoc = {
    enable = true;
    package = pkgs.pandoc;
    defaults = {
      metadata = { author = "陈楷文"; };
      pdf-engine = "xelatex";
      citeproc = true;
    };
  };
}
