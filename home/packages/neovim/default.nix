{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "nvim-config";
  src = pkgs.fetchFromGitHub {
    owner = "sbsto";
    repo = "nvim";
    rev = "main"; 
    sha256 = ""; 
  };

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';
}
