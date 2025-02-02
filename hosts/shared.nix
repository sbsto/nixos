{ config, pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    zsh.enable = true;
    _1password.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
