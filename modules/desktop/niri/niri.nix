{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf bifrost.sessions.niri.enable {
    programs.niri = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
