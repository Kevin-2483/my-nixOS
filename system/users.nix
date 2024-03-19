{ config, pkgs, inputs, ... }:

{
  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kevin = {
    isNormalUser = true;
    description = "kevin";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    openssh.authorizedKeys.keys = [
            # replace with your own public key
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINp5yNzn4trWn3C84uCsa1urwk/Cj39tXpJr2HEkDh3c kevin@nixos"
        ];
        
    shell = pkgs.zsh;
        
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
  };

  
}
