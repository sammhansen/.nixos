{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  imports = [
    ./settings.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland = mkIf bifrost.sessions.hyprland.enable {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };

  home.packages = with pkgs; [
    hyprshade
    uwsm
  ];
}
