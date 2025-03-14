{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 22 ];
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "uk";

  services = {
    printing.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
  };

  security.rtkit.enable = true;

  users = {
    users = {
      sbsto = {
        isNormalUser = true;
        description = "sbsto";
        extraGroups = [ "networkmanager" "wheel" ];
        openssh.authorizedKeys.github = [ "sbsto" ];
      };

      tonytarizzo = {
        isNormalUser = true;
        description = "tonytarizzo";
        extraGroups = [ ];
        openssh.authorizedKeys.keys =
          let
            authorizedKeys = pkgs.fetchurl {
              url = "https://github.com/tonytarizzo.keys";
              sha256 = "sha256-P38Gq8WUyuwuT9LCq2Tv0zNSpxfT6fOzNCUbHYvWsrw=";
            };
          in
          pkgs.lib.splitString "\n" (builtins.readFile authorizedKeys);
      };

      wannabehero = {
        isNormalUser = true;
        description = "wannabehero";
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys =
          let
            authorizedKeys = pkgs.fetchurl {
              url = "https://github.com/wannabehero.keys";
              sha256 = "sha256-3EQ/XH4jxhakUR1tYAQmSqFJl23pHdi4lCrGZ1m6uYI=";
            };
          in
          pkgs.lib.splitString "\n" (builtins.readFile authorizedKeys);
      };
    };

    defaultUserShell = pkgs.zsh;
  };

  system.stateVersion = "24.05";
}
