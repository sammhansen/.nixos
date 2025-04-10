{bifrost, ...}: {
  imports = [
    ./env.nix
    ./pkgs
    ./sessions
    ./dev
    ./xdg.nix
  ];

  home.username = bifrost.userconf.username;
  home.homeDirectory = "/home/${bifrost.userconf.username}";

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
