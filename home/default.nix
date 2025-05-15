{bifrost, ...}: {
  imports = [
    ./env.nix
    ./xdg.nix
    ./applications.nix

    ./programs
    ./services
    ./desktop
    ./dev
  ];

  programs.home-manager.enable = true;
  home = {
    username = bifrost.userconf.username;
    homeDirectory = "/home/${bifrost.userconf.username}";
    stateVersion = "24.11";
  };
}
