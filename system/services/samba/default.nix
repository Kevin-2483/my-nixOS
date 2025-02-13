{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    nsswins = true;
    settings = {
  global = {
    workgroup = "smbnix";
    "server string" = "smbnix";
    "netbios name" = "smbnix";
    security = "user";
    "hosts allow" = "0.0.0.0/0";
    # "hosts deny" = "0.0.0.0/0";
    "guest account" = "nobody";
    "map to guest" = "bad user";
    # "use sendfile" = "yes"; # 取消注释启用
    # "max protocol" = "smb2"; # 取消注释启用
  };
};
    shares = {
      # public = {
      #   path = "/home/kevin/services/samba/public";
      #   browseable = "yes";
      #   "read only" = "no";
      #   "guest ok" = "yes";
      #   "create mask" = "0644";
      #   "directory mask" = "0755";
      #   "force user" = "GUEST";
      #   "force group" = "GUEST";
      # };
      private = {
        path = "/home/kevin/services/samba/private";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "kevin";
        "force group" = "kevin";
      };
    };
  };

  services.samba-wsdd = {
    workgroup = "smbnix";
    enable = true;
    openFirewall = true;
    discovery = true;
  };
}
