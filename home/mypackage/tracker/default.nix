{
  rustPlatform,
  fetchFromGitHub,
  lib,
}:

rustPlatform.buildRustPackage rec {
  pname = "tracker";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "ShenMian";
    repo = "tracker";
    rev = "v${version}";
    hash = "sha256-z0eRyTx25lP8zukYf4R7rrPRwSzn1xeVFGFzTmde6gg=";
  };

  cargoHash = "sha256-Cb9Fxt61lhOZkSjXvBMFCklVQkwA4McDCNFwLk5mmEI=";
 
  meta = {
    description = "A terminal-based real-time satellite tracking and orbit prediction application.";
    homepage = "https://github.com/ShenMian/tracker";
    license = lib.licenses.asl20;
    mainProgram = "tracker";
  };
}
