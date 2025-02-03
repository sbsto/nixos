{ config, pkgs, ... }: {
  imports = [
    ../shared.nix
  ];

  users.users.sambrownstone = {
    isNormalUser = true;
    name = "sambrownstone";
    home = "/Users/sambrownstone";
    description = "Existing macOS user";
  };

  services.nix-daemon.enable = true;

  environment.systemPackages = [ ];

  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  time.timeZone = "Europe/London";
}
