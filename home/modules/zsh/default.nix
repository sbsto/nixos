{ config, lib, pkgs, ... }:
let
  starship-config = pkgs.stdenv.mkDerivation {
    name = "starship-config";
    src = pkgs.fetchFromGitHub {
      owner = "sbsto";
      repo = "starship";
      rev = "main";
      sha256 = "sha256-H8Z38wPDsE8z8VFz97uHXqvtDOqg2t5eBwRv04QUpu8=";
    };
    installPhase = ''
      mkdir -p $out
      cp config.toml $out/
    '';
  };
in
{
  home.file.".config/starship/config.toml".source = starship-config + "/config.toml";

  programs.zsh = {
    enable = true;
    shellAliases = { };

    initExtra = ''
      # Initialize starship prompt. (Requires that the starship binary is installed)
      eval "$(starship init zsh)"
      export STARSHIP_CONFIG=~/.config/starship/config.toml
    '';
  };

  home.packages = with pkgs; [
    starship
  ];
}
