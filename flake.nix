{
  description = "Hansen's Nix Setup";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    hyprland = {
      url = "github:hyprwm/Hyprland?rev=d26439a0fe5594fb26d5a3c01571f9490a9a2d2c&submodules=1";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      # inputs.nixpkgs.follows = "hyprland";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm = {
      url = "github:wez/wezterm?dir=nix";
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

    ags = {
      type = "github";
      owner = "Aylur";
      repo = "ags";
      ref = "v1.9.0";
    };

    walker = {
      type = "github";
      owner = "abenz1267";
      repo = "walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen = {
      type = "github";
      owner = "InioX";
      repo = "Matugen";
      ref = "v2.4.1";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    catppuccin,
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
          ./nodes/asgard

          {
            nixpkgs.config = {
              allowUnfree = true;
              # allowBroken = true;
            };
          }
          nur.modules.nixos.default
          nur.legacyPackages."${system}".repos.iopq.modules.xraya

          catppuccin.nixosModules.catppuccin

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
                  ./user
                  catppuccin.homeModules.catppuccin
                  inputs.walker.homeManagerModules.default
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
