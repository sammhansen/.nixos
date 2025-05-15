{
  bifrost,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  programs = mkIf bifrost.sessions.hyprland.enable {
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      withUWSM = true;
      xwayland.enable = true;
    };

    nm-applet.indicator = false;
  };
}
