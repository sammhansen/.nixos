{pkgs, ...}: {
  imports = [
    ./browsers/default.nix
    ./terminals/default.nix
    ./zoom.nix
    ./pkgs.nix

    ./launchers
    ./bars
    ./senpwai.nix
    # ./swaync.nix
  ];

  home.packages = with pkgs; [
    (callPackage ./burpsuite-pro.nix {})
  ];
}
