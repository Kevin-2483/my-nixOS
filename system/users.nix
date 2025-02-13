{ username, config, pkgs, inputs, ... }:

{


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker" ];
    openssh.authorizedKeys.keys = [
      # replace with your own public key
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNLDgV4DLjSI81J/DDQTZajznAa84Wtrnxvar7OJVIP+LJWv/noJ8HgQt+kH4aTmtWX8EXGBzz9UuqhkFFARMWK7w2xCZVmQ4AdIU9eZaPOl0BlwKYRQsDehz/88xxhIgNiTfXVNTL3ZMZqeV4DGm5co7mVKegtcQd5F7DV8b0SaD8cp4Mc4PsF8WnIw9VlVNQB2tt+dZApufsi/IMWMGz3+FyJ1KwttQvnxrm+dt5iVZYm+6vnRxFylQY/hyeJ3NZjaLU2pOWOfwEHJcsBTY0UBK7V8OOw11r4aUCOZGA84XvvEIXCGKrj3GBFzbP3DQroSOwrU8TaoLszBRhrQc4vz+Y6KAU5SqTmPt1SgbjnU1JfdeQEmHF04M6jZtPwxsnhio9LuZPsZqWo5O2eNgzhh20wK51qHmajcDeK1rH5h1aweaR9/fR8tsXQAxZmO8Viya5tUoHokHDKI4QIDrQYK7TYiyVEoT2NLctLQI7KkVzIGsY9BI4mFVf6xiBPyo0EKU1ohzPSJOAUNsFvxZAZmhk5WJapgsKkETH55dD/pmiVwmcIhbZv0tV7O5BWGQIQl0Kh+ytGtciARLDdC2deKFkXAHmd0w05HDePmpa5xttCQoazheDZK8yCCfe7t+GbQ15gnndlnLX0MWqqIaHEtu6IEMcq9OvJAKeKvYxAQ== 3244577394@qq.com"
    ];

    shell = pkgs.zsh;

    packages = with pkgs; [
      #  firefox
      #  thunderbird
    ];
  };
}
