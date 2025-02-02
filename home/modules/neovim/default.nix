# packages/neovim/default.nix
{ config, pkgs, lib, ... }:
let
  nvim-config = pkgs.stdenv.mkDerivation {
    name = "nvim-config";
    src = pkgs.fetchFromGitHub {
      owner = "sbsto";
      repo = "nvim";
      rev = "main"; 
      sha256 = "sha256-6GrbURcKy84/bXH0JOs4RHdEyrx5LF/Q3TNhY6avTT8="; 
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
