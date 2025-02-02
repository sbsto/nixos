{ config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv) isDarwin;
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in
{
  home = {
    packages = with pkgs; [
      nixpkgs-fmt
    ];

    shellAliases = rec {
      nixpkgs = "nix repl '<nixpkgs>'";
      update = "nix flake update";
      rebuild =
        if isDarwin
        then "darwin-rebuild build --flake '.#alphabook'"
        else "nixos-rebuild build --flake '.#nixos'";
      switch =
        if isDarwin
        then "darwin-rebuild switch --flake '.#alphabook'"
        else "sudo nixos-rebuild switch --flake '.#nixos'";
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
  };
}
