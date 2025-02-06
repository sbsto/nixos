{
  description = "sbsto/dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = { nixpkgs, home-manager, darwin, ... }: {

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "backup2";

            home-manager.users.sbsto = import ./home/nixos/sbsto.nix;
            home-manager.users.tonytarizzo = import ./home/nixos/tonytarizzo.nix;
            home-manager.users.wannabehero = import ./home/nixos/wannabehero.nix;
          }
        ];
      };
    };

    darwinConfigurations = {
      alphabook = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/macos/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.users.sambrownstone = import ./home/macos.nix;
          }
        ];
      };
    };
  };
}
