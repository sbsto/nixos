{ config, pkgs, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in
{
  home = {
    shellAliases = {
      nixpkgs = "nix repl '<nixpkgs>'";
      update = "nix flake update ${dotfiles}";
      rebuild = "nixos-rebuild build --flake ${dotfiles}#nixos";
      switch = "sudo nixos-rebuild switch --flake ${dotfiles}#nixos";
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
