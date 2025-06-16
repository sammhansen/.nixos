{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome-chess
    stockfish
  ];
}
