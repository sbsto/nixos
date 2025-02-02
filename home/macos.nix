{ config, pkgs, ... }: {
  imports = [ ./shared.nix ];

  home = {
    username = "sbsto";
    homeDirectory = "/Users/sbsto";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
    };
  };
}
