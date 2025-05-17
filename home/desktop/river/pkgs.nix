{pkgs, ...}: {
  home.packages = with pkgs; [
    wlr-randr
    wideriver
    rivercarro
  ];
}
