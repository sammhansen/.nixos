{
  bifrost,
  pkgs,
  ...
}: {
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
    packages = with pkgs; [
      swww
      surf
      grim
      slurp
      swappy
      tofi
      mov-cli
    ];

    stateVersion = "24.11";
  };
}
