{ config, pkgs, ... }:

let
  shared = import ../shared.nix { inherit config pkgs; };
in
{
  imports = [ ../shared.nix ];

  home = {
    username = "sbsto";
    homeDirectory = "/home/sbsto";
    stateVersion = "24.05";
  };

  programs.git = shared.programs.git // {
    userName = "sbsto";
    userEmail = "brownstone@hey.com";
  };

  programs = {
    home-manager.enable = true;
  };
}
