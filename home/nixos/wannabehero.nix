{ config, pkgs, ... }: 

let
  shared = import ./shared.nix { inherit config pkgs; };
in
{
  imports = [ ../shared.nix ];

  home = {
    username = "wannabehero";
    homeDirectory = "/home/wannabehero";
    stateVersion = "24.05";
  };

  programs.git = shared.programs.git // {
    userName = "wannabehero";
  };

  programs = {
    home-manager.enable = true;
  };
}
