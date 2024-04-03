{ pkgs, ...}:
{
	services.meshcentral = {
		enable = true;
		package = pkgs.meshcentral;
		settings = {
		  # domains = {
		  #   "" = {
		  #     certUrl = "https://meshcentral.example.com/";
		  #   };
		  # };
		  settings = {
		    # Cert = "meshcentral.example.com";
		    Port = 4430;
		    # TlsOffload = "10.0.0.2,fd42::2";
		    WANonly = false;
		  };
		};
	};
}
