{
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer) {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
