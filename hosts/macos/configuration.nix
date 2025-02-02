{ config, pkgs, ... }: {
  imports = [
    ../shared.nix
  ];

  services.nix-daemon.enable = true;

  environment.systemPackages = [ ];

  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  time.timeZone = "Europe/London";
}
