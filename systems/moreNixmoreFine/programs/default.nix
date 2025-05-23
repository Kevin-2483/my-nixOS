{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  imports =
    [
      ./nix-ld
      ./zsh
      ./proxychains-ng
      ./nix
      ./direnv
      ./nix-index
      ./command-not-found
    ];
}
