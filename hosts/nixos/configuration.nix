{ config, pkgs, ... }:

let
  fetchGitHubKeys = username:
    builtins.filter (k: k != "")
      (builtins.splitString "\n"
        (builtins.fetchurl ("https://github.com/" + username + ".keys")));
in {
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

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
        openssh.authorizedKeys.keys = fetchGitHubKeys "sbsto";
      };

      wannabehero = {
        isNormalUser = true;
        description = "wannabehero";
        extraGroups = [ "networkmanager" "wheel" ];
        openssh.authorizedKeys.keys = fetchGitHubKeys "wannabehero";
      };
    };

    defaultUserShell = pkgs.zsh;
  };

  system.stateVersion = "24.05";
}
