{ outputs, ... }:
{
	imports = [
		./hardware-configuration.nix
		./y9000p12900h3070.nix
		
	];

	nixpkgs = {
	            overlays = [
	              # Add overlays your own flake exports (from overlays and pkgs dir):
	              outputs.overlays.stable-packages
	            ];
	            config = {
	                  allowUnfree = true;
	                  # Workaround for https://github.com/nix-community/home-manager/issues/2942
	                  allowUnfreePredicate = _: true;
	                };
	            };
	
}
