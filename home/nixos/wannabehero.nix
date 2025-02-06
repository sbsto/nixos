
{ config, pkgs, ... }: {
  imports = [ ../shared.nix ];

  home = {
    username = "wannabehero";
    homeDirectory = "/home/wannabehero";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
