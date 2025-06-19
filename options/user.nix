{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options = {
    bifrost = {
      user = {
        name = mkOption {
          type = types.str;
          default = "Ha" + "ns" + "en";
          description = "Your desired name";
        };
        username = mkOption {
          type = types.str;
          default = "ta" + "ma" + "ra";
          description = ''
            Your desired username.This installation CURRENTLY supports only one user
          '';
        };
        locale = mkOption {
          type = types.str;
          default = "en_US.UTF-8";
          description = "The locale to use";
        };
        timezone = mkOption {
          type = types.str;
          default = "Af" + "ri" + "ca" + "/" + "Na" + "ir" + "obi";
          description = "The timezone to use";
        };
      };
    };
  };
}
