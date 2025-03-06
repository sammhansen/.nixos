{pkgs, ...}: {
  home.packages = with pkgs; [
    tor-browser
    ladybird
    amberol
  ];
}
