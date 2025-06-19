{
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  entries = ../.local/share/applications;
in {
  config = mkIf (!isServer) {
    xdg.dataFile = {
      "applications" = {
        recursive = true;
        source = "${entries}";
      };
    };
  };
}
