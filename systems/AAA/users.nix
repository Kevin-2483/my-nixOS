{ username, config, pkgs, inputs, ... }:

{


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker" "samba" ];
    openssh.authorizedKeys.keys = [
      # replace with your own public key
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5O3gv9udcjww3ktTQSyzbVnNwCuvwkofLqabSO7e2goIXUC/77JB2eMqOi2+5H6ELXnjljnjNNyaT5/3TaZ/e5VZv/t+Xp+q7/oiHj7+2no6k4ve2NLcghHpz7tpqeUjl5Qra/Wqzp+FP6Qxc/7UWI5O5/n0P38ULjEZq/6cKzmv6j6U66ZntEYWr1L2atYlcvHIMfMyZYIo8pX5yawgArydPUi6XAxjsCAgqWt8/lVO2hNpK7Ut09mFXy/orEm9AKCKsO68pUYvYNXCKYHonavHHZzb4kArXwoVVldrMLUVkMohq6VhMf72OCNsHzMiXlyxphyEqTjB/xo0A3redCTp65amPp4fMZiBKJqZ13kzY15aqkuTwF8fDIA8q7oKIUlkrESEt/YLhYfwbKFkty5SKKCAWGbQHNyL2Cn/TvsbXrWjPA80iaDsGfzudHXgk41XnqgO5CU1tpzF6AYy0Wfbei+dW7dIFMpsF35W+fGJQV7nUim6+98o6rEsA7uXR8nsxPUlducM2tEvJQjdduWSDNjfc6dKxfF+h5S2GiiT0Xy40cWIT7Utt49Uv6NCYZ0IgbkMDXewcBuw/zno8AQuVGRWYmowqkhziZLKBSaNkj1x/rBQLhsKyPxoa02w1OU3GyVepGXOW93DJhRrfvUXaKXoeL2FV8ryTNB7rrw== 3244577394@qq.com"
    ];

    shell = pkgs.zsh;

    packages = with pkgs; [
      #  firefox
      #  thunderbird
    ];
  };
}
