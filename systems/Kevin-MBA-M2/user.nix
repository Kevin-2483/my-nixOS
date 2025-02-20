{ username, pkgs, ... }: {
  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
    # shell = "${pkgs.nushell}/bin/nu";
  };
}
