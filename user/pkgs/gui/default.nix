{pkgs, ...}: {
  imports = [
    ./desktop.nix
    ./browsers
    ./terminals
    ./zoom.nix
    ./pkgs.nix
    ./discord.nix
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
