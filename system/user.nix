{ username, ... }: {
  users.users.${username} = {
        name = "${username}";
        home = "/Users/${username}";
  };
}