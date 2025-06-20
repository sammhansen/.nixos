{
  lib,
  pkgs,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer && isWayland) {
    services.cliphist = {
      enable = true;
      allowImages = true;
      systemdTargets = [
        "graphical-session.target"
      ];
    };

    home.packages = with pkgs; [
      wl-clipboard-rs
    ];
  };
}
