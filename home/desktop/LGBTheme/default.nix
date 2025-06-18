{pkgs, ...}: {
  imports = [
    ./matugen
    ./gtk.nix
    ./meowt.nix
    # ./qt.nix
  ];
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = false;
  };
}
