{ config, pkgs, ... }: {
  imports = [ ../shared.nix ];

  home = {
    username = "tonytarizzo";
    homeDirectory = "/home/tonytarizzo";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
