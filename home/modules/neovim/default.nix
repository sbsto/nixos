# packages/neovim/default.nix
{ config, pkgs, lib, ... }:
let
  nvim-config = pkgs.stdenv.mkDerivation {
    name = "nvim-config";
    src = pkgs.fetchFromGitHub {
      owner = "sbsto";
      repo = "nvim";
      rev = "main"; 
      sha256 = "sha256-ZvD5dZ32eGRN4MNerV91T3n7GAW815abfgmUQwfu8ME="; 
    };
    installPhase = ''
      mkdir -p $out
      cp -r ./* $out/
    '';
  };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = nvim-config;
}
