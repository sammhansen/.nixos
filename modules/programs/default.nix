{pkgs, ...}: {
  imports = [
    ./pentest
    ./qbittorent
    ./thunar
    ./games
  ];
  programs = {
    dconf.enable = true;
    fish.enable = true;
    zsh.enable = true;
    command-not-found = {
      enable = false;
    };
    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
        stdenv.cc.cc
        glibc
      ];
    };
  };

  environment.systemPackages = with pkgs;
  with nodePackages_latest;
  with libsForQt5; [
    d-spy
    dconf-editor
    qt5.qtimageformats
    acpi
    ffmpeg
    libnotify
    procps
    curl
    wget
    glib
    killall
    inetutils
    pciutils
    usbutils
    gcc
    cmake
    gnumake
  ];
}
