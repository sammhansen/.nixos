{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options = {
    bifrost = {
      monitors = {
        main = mkOption {
          type = types.str;
          default = "HDMI-A-2";
          description = "The monitor to be perceived as the main display";
        };
        inbuilt = {
          name = mkOption {
            type = types.str;
            default = "eDP-1";
            description = "The name of the inbuilt monitor";
          };
          position = {
            x = mkOption {
              type = types.int;
              default = 0;
              description = "x coordinate of the inbuilt display relative to the main display";
            };
            y = mkOption {
              type = types.int;
              default = 1080;
              description = "y coordinate of the inbuilt display relative to the main display";
            };
          };
        };
        external = {
          name = mkOption {
            type = types.str;
            default = "HDMI-A-2";
            description = "Name of the external monitor";
          };
        };
      };
    };
  };
}
