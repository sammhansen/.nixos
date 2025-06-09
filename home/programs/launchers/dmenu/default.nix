{pkgs, ...}: let
  dmenu = pkgs.dmenu.override {
    patches = [
      ./patches/center.diff
    ];
  };
in {
  home.packages = [
    dmenu
  ];
}
