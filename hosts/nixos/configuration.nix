{ config, pkgs, ... }:

let
in {
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  programs.zsh.enable = true;

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
        openssh.authorizedKeys.keys =
          let
            authorizedKeys = pkgs.fetchurl {
              url = "https://github.com/sbsto.keys";
              sha256 = "sha256-eEXtCji/atYRRQLsriBf0AZkvNt7eVdFzUYoBJGRYH0";
            };
          in
          pkgs.lib.splitString "\n" (builtins.readFile authorizedKeys);
      };

      tonytarizzo = {
        isNormalUser = true;
        description = "tonytarizzo";
        extraGroups = [];
        openssh.authorizedKeys.keys =
          let
            authorizedKeys = pkgs.fetchurl {
              url = "https://github.com/tonytarizzo.keys";
              sha256 = "";
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
              sha256 = "";
            };
          in
          pkgs.lib.splitString "\n" (builtins.readFile authorizedKeys);
      };
    };

    defaultUserShell = pkgs.zsh;
  };

  system.stateVersion = "24.05";
}
