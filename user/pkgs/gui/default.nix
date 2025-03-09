{pkgs, ...}: {
  imports = [
    ./browsers/default.nix
    ./terminals/default.nix
    ./zoom.nix
    ./pkgs.nix

    ./launchers/default.nix
    ./senpwai.nix
  ];

  home.packages = with pkgs; [
    (callPackage ./burpsuite-pro.nix {})
  ];
}
