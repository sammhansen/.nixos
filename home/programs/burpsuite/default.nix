{pkgs, ...}: {
  home.packages = with pkgs; [
    (callPackage ./burpsuite-pro.nix {})
  ];
}
