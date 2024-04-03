{
	services.samba = {
	  enable = true;
	  securityType = "user";
	  openFirewall = true;
	  nsswins = true;
	  extraConfig = ''
	    workgroup = smbnix
	    server string = smbnix
	    netbios name = smbnix
	    security = user 
	    #use sendfile = yes
	    #max protocol = smb2
	    # note: localhost is the ipv6 localhost ::1
	    hosts allow = 0.0.0.0/0
	    # hosts deny = 0.0.0.0/0
	    guest account = nobody
	    map to guest = bad user
	  '';
	  shares = {
	    public = {
	      path = "/home/kevin/services/samba/public";
	      browseable = "yes";
	      "read only" = "no";
	      "guest ok" = "yes";
	      "create mask" = "0644";
	      "directory mask" = "0755";
	      "force user" = "GUEST";
	      "force group" = "GUEST";
	    };
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
