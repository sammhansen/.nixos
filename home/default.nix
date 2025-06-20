{username, ...}: {
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
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
}
