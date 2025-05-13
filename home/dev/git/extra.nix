{pkgs, ...}: {
  home.packages = with pkgs; [
    gist
    gitflow
    cocogitto
  ];
}
