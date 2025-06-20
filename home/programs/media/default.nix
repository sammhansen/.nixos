{inputs, ...}: {
  imports = [
    ./mpv
    ./amberol
    ./youtube-music
    ./spotify
    ./zathura
  ];
  home.packages = [
    inputs.senpwai.packages.x86_64-linux.default
  ];
}
