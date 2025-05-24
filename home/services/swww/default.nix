{pkgs, ...}: {
  imports = [
    ./waypaper.nix
  ];
  home.packages = with pkgs; [
    swww
  ];
}
