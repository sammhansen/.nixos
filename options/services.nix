{lib, ...}: let
  inherit (lib) mkEnableOption mkOption types;
in {
  options = {
    bifrost = {
      services = {
        easyeffects = {
          enable = mkEnableOption "Whether to enable the easyeffects service";
          fixed-quantum = {
            enable = mkOption {
              type = types.bool;
              default = false;
              description = ''
                When enabled, this changes the default clock quantum, min-quantum and max-quantum to 1024
              '';
            };
          };
        };
      };
    };
  };
}
