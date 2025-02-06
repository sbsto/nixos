{ config, pkgs, ... }: {
  imports = [ ../shared.nix ];

  home = {
    username = "sbsto";
    homeDirectory = "/home/sbsto";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
