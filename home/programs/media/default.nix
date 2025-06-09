{pkgs, ...}: {
  imports = [
    ./mpv
    ./youtube-music
    ./spotify
    ./senpwai
    ./zathura
  ];

  home.packages = with pkgs; [
    amberol
  ];
}
