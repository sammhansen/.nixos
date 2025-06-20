{
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer) {
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
      ];
    };
  };
}
