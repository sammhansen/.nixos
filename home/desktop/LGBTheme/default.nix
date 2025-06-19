{
  isServer,
  isNiri,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  imports = [
    ./matugen
    ./gtk.nix
    ./qt.nix
  ];
  config = mkIf (!isServer && isNiri) {
    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
      x11.enable = false;
    };
  };
}
