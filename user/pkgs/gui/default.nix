{pkgs, ...}: {
  imports = [
    ./browsers
    ./terminals
    ./zoom.nix
    ./pkgs.nix

    ./launchers
    ./bars
    ./senpwai.nix
  ];

  home.packages = with pkgs; [
    (callPackage ./burpsuite-pro.nix {})
  ];
}
