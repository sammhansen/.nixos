{
  username,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options = {
    bifrost = {
      device = {
        system = mkOption {
          type = types.str;
          default = "x86_64-linux";
          description = "The device achitechture";
        };
        hostname = mkOption {
          type = types.str;
          default = "he" + "ll";
          description = "Your desired hostname";
        };
        flakeDir = mkOption {
          type = types.str;
          default = "/home/${username}/.nixos";
          description = "Name of the directory containing the flake";
        };
        walDir = mkOption {
          type = types.str;
          default = "/home/${username}/Pictures/wallpapers";
          description = "Name of the directory your wallpapers";
        };
        keyLayout = mkOption {
          type = types.str;
          default = "us";
          description = "The keyboard layout to use";
        };
        dualBoot = mkOption {
          type = types.bool;
          default = false;
          description = ''
            Whether to you are dual booting.Enables osprober and hardware clock
          '';
        };
        isLaptop = mkOption {
          type = types.bool;
          default = false;
          description = "Whether device is a laptop";
        };
        isIntel = mkOption {
          type = types.bool;
          default = false;
          description = "Whether device uses an Intel GPU";
        };
        isServer = mkOption {
          type = types.bool;
          default = false;
          description = "Whether device is a server";
        };
      };
    };
  };
}
