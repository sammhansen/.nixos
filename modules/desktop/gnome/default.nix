{
  lib,
  bifrost,
  ...
}: let
  inherit (lib.modules) mkIf;
  layout = bifrost.sysconf.keyboardlayout;
in {
  services = mkIf bifrost.sessions.gnome.enable {
    xserver = {
      enable = true;
      videoDrivers = ["intel"];
      xkb = {
        layout = "${layout}";
        variant = "";
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };
}
