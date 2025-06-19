{lib, ...}: let
  inherit (lib) mkEnableOption mkOption types;
in {
  options = {
    bifrost = {
      displayManager = {
        default = mkOption {
          type = types.str;
          default = "sddm";
          description = ''
            Whether to use sddm as the display manager.
            Alternative provided: "ly"
          '';
        };
      };
      windowManager = {
        gnome = {
          enable = mkEnableOption "gnome";
        };
        niri = {
          enable = mkEnableOption "niri";
        };
      };
    };
  };
}
