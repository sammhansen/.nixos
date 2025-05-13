{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.hyprland;
in {
  imports = [
    ./settings.nix
    ./binds.nix
    # ./colors.nix
  ];

  wayland.windowManager.hyprland = mkIf cfg.enable {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };

  home.packages = with pkgs; [
    hyprsunset
    uwsm
  ];
}
