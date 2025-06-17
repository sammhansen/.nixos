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

    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
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

    zen-browser = {
      type = "github";
      owner = "sammhansen";
      repo = "zen-browser-flake";
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
    distro-grub-themes,
    catppuccin,
    ...
  } @ inputs: let
    inherit (self) outputs;
    inherit (import ./bifrost.nix) bifrost;

    system = bifrost.sysconf.system;
    host = bifrost.sysconf.host;
    username = bifrost.userconf.username;
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs username bifrost host system;
        };

        modules = [
          ./hosts
          sops-nix.nixosModules.sops
          catppuccin.nixosModules.catppuccin
          distro-grub-themes.nixosModules.${system}.default

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users."${username}" = {
                imports = [
                  ./home
                  catppuccin.homeModules.catppuccin
                ];
              };
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs outputs username bifrost host system;
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
