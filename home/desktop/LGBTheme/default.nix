{
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  imports = [
    ./matugen
    ./gtk.nix
    ./qt.nix
  ];
  config = mkIf (!isServer) {
    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
      x11.enable = false;
    };
  };
}
