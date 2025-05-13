{
  description = "Hansen's Nix Setup";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      type = "github";
      owner = "sammhansen";
      repo = "zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";

    #NUR
    flake-utils.url = "github:numtide/flake-utils";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nur,
    ...
  } @ inputs: let
    inherit (import ./bifrost.nix) bifrost;
    system = bifrost.sysconf.system;
    host = bifrost.sysconf.host;
    username = bifrost.userconf.username;

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
      };
    };
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit host;
          inherit bifrost;
        };

        modules = [
          ./hosts

          {
            nixpkgs.config = {
              allowUnfree = true;
              # allowBroken = true;
            };
          }
          nur.modules.nixos.default
          nur.legacyPackages."${system}".repos.iopq.modules.xraya

          inputs.distro-grub-themes.nixosModules.${system}.default

          # Make pkgs-stable available as a special argument for modules
          {
            _module.args.pkgs-stable = pkgs-stable;
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              # useGlobalPkgs = true;
              useUserPackages = true;
              users."${username}" = {
                imports = [
                  ./home
                ];
              };
              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit pkgs;
                inherit system;
                inherit inputs;
                inherit username;
                inherit bifrost;
              };
            };
          }
        ];
      };
    };
  };
}
