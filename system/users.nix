{ config, pkgs, inputs, ... }:

{
  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kevin = {
    isNormalUser = true;
    description = "kevin";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    openssh.authorizedKeys.keys = [
            # replace with your own public key
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDgc07ggwz2bD17Y7W0ZjkvvAAl6at+yqsRPjqj0PlHaUIfgCF6V0/P44F9+vUcPcbF1z+ny0jAXIi4lunoHti97kH8pmhnwem8K4plvITOjn3lV214Il7NmnfouNfdn7dmMFY2cvfaV0Un0qI9mfwUiQyrw960nCQcubdrvH2qMXNFmAAcWRQpIprHFPhwLKycdBXW6Q1Pp9cYUH3DsDOrGULrhjurLUkVdqEO5j73URCQCOPiU9C32dSGxdY1RVK+Vdd0Gma59VkkTY2CD0n73M/IvbcJ7wvwfhC6nrLi1DSO0pwQLEjI5JVLgzf+m1WcVWzTYeM2xKLzCcFxVYjk56A/g4SoDXEcVAWIMjb/0foZz9+hg+uejqA4QPSTg4yqOcgxxOtzW1be4CY/sOfMzCXp8HM+zTr3wVN2azQ9+9hyw1YYPPi4+c6pUyCoQbW1VEU4/nKcnUAlTJhXZl01Dtl8ei9nQuxDrqngDOkIU3m7VkvPvXiARxnzucr7o5kCTeABQKaUKvqDmLw+wEUP/lc/4ehzu7xSme08QxmAtdFElBo+zn7qc1g02seD6vCyjDaGeu3NtvIdNZIONVcObzjkOVWg950R7wYL7xADdAQHLRgXYbz4RL4VGyHDBhUHYI4xWWWtZwG5AhYZq2NRAASAG3r1VbGejSHF5D4GQ== 3244577394@qq.com"
        ];
        
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
  };

  
}
