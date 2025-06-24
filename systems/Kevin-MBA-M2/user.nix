{ username, pkgs, ... }: {
  system.primaryUser = "${username}";
  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
    # shell = "${pkgs.nushell}/bin/nu";
  };
}
