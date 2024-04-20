let
  email = "3244577394@qq.com";
  name = "Kevin-2483";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "micro";
      credential.helper = "store";
      github.user = name;
      push.autoSetupRemote = true;
      # http.proxy = socks5://127.0.0.1:1080;
      # https.proxy = socks5://127.0.0.1:1080;
    };
    userEmail = email;
    userName = name;
  };
}
