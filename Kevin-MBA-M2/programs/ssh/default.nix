{
  programs.ssh = {
    extraConfig = ''
    Host linux-builder
      User builder
      Hostname localhost
      HostKeyAlias linux-builder
      IdentityFile /etc/nix/builder_ed25519
      Port 31022
    Host server
      HostName kevin.2k2.cc
      User kevin
      HostKeyAlias server
      IdentityFile /Users/kevin/.ssh/id_rsa
      Port 3322
    Host cloud
      HostName kevin.2k2.cc
      User kevin
      Port 22
  '';
  };
}