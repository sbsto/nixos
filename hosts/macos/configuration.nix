{ ... }: {
  imports = [
    ../shared.nix
  ];

  users.users.sambrownstone = {
    name = "sambrownstone";
    home = "/Users/sambrownstone";
  };

  services.nix-daemon.enable = true;

  environment.systemPackages = [ ];

  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  time.timeZone = "Europe/London";
}
