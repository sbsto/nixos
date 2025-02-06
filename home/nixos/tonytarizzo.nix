{ config, pkgs, ... }:

let
  shared = import ../shared.nix { inherit config pkgs; };
in
{
  imports = [ ../shared.nix ];

  home = {
    username = "tonytarizzo";
    homeDirectory = "/home/tonytarizzo";
    stateVersion = "24.05";
  };

  programs.git = shared.programs.git // {
    userName = "tonytarizzo";
  };
}
