{
  isServer,
  isNiri,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer && isNiri) {
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
