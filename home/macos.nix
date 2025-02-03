{ config, pkgs, ... }: {
  imports = [ ./shared.nix ];

  home = {
    username = "sambrownstone";
    homeDirectory = "/Users/sambrownstone";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
