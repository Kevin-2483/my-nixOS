
{ config, pkgs, inputs, ... }:

{
  
programs.nix-ld = {
  		enable = true;
  		package = pkgs.nix-ld;
  		# libraries = [ pkgs.xorg.libX11 pkgs.zlib pkgs.xorg.libXxf86vm pkgs.libGL pkgs.libstdcxx5 ];
  	};

}
