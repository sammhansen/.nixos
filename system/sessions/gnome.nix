{
  lib,
  bifrost,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  services = mkIf bifrost.sessions.gnome.enable {
    xserver = {
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };
}
