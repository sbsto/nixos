{ config, pkgs, ... }: {
  imports = [
    ../shared.nix
  ];

  users.users.sambrownstone = {
    isNormalUser = true;
    name = "sambrownstone";
    home = "/Users/sambrownstone";
    description = "Existing macOS user";
    extraGroups = [ "wheel" ];  # Grants sudo access, among other potential privileges.
  };

  services.nix-daemon.enable = true;

  environment.systemPackages = [ ];

  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  time.timeZone = "Europe/London";
}
