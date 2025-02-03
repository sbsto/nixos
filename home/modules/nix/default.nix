{ config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv) isDarwin;
  dotfiles = "${config.home.homeDirectory}/dotfiles"; # adjust path to match your setup
in
{
  home = {
    shellAliases = rec {
      nixpkgs = "nix repl '<nixpkgs>'";
      update = "nix flake update ${dotfiles}";
      rebuild =
        if isDarwin
        then "darwin-rebuild build --flake ${dotfiles}#alphabook"
        else "nixos-rebuild build --flake ${dotfiles}#nixos";
      switch =
        if isDarwin
        then "darwin-rebuild switch --flake ${dotfiles}#alphabook"
        else "sudo nixos-rebuild switch --flake ${dotfiles}#nixos";
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
