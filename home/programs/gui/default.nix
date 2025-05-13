{pkgs, ...}: {
  imports = [
    ./desktop.nix
    ./browsers
    ./zoom.nix
    ./pkgs.nix
    ./discord
    ./zathura.nix
    ./waypaper.nix

    ./launchers
    ./bars
    ./senpwai.nix
    ./spotify.nix
    ./obs-studio.nix
  ];

  home.packages = with pkgs; [
    (callPackage ./burpsuite-pro.nix {})
  ];
}
