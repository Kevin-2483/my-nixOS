{
  nix.distributedBuilds = false;
  # nix.buildMachines = [{
  #   hostName = "localhost";
  #   sshUser = "builder";
  #   sshKey = "/etc/nix/builder_ed25519";
  #   system = "aarch64-linux";
  #   maxJobs = 4;
  #   supportedFeatures = [ "kvm" "benchmark" "big-parallel" ];
  # }];
}
