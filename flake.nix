{
  description = "May the cats be with you.SO MOTE IT BE";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    spicetify-nix = {
      type = "github";
      owner = "Gerg-L";
      repo = "spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    burpsuitepro = {
      type = "github";
      owner = "xiv3r";
      repo = "Burpsuite-Professional";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    senpwai = {
      type = "github";
      owner = "sammhansen";
      repo = "senpwai-flake-check";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      type = "github";
      owner = "Mic92";
      repo = "sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minegrub-theme = {
      type = "github";
      owner = "Lxtharia";
      repo = "minegrub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    sops-nix,
    nixcord,
    ...
  } @ inputs: let
    inherit (self) outputs;

    inherit (import ./.) bifrost;
    inherit (import ./.colors.nix) colors;

    cfg = bifrost;

    system = cfg.device.system;
    hostname = cfg.device.hostname;
    username = cfg.user.username;

    isServer = cfg.device.isServer;
    isIntel = cfg.device.isIntel;
    isLaptop = cfg.device.isLaptop;
    isWayland = cfg.windowManager.niri.enable;
  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs bifrost username colors hostname system isLaptop isServer isIntel isWayland;
        };

        modules = [
          ./hosts
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users."${username}" = {
                imports = [
                  ./home
                ];
              };
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs outputs bifrost username colors hostname system isLaptop isServer isIntel isWayland;
              };
              sharedModules = [
                nixcord.homeModules.nixcord
              ];
            };
          }
        ];
      };
    };
  };
}
