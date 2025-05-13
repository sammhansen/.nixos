{pkgs, ...}: {
  environment.systemPackages = with pkgs;
  with nodePackages_latest;
  with libsForQt5; [
    d-spy
    dconf-editor
    qt5.qtimageformats

    acpi
    ffmpeg
    libnotify
    gobject-introspection
    procps

    curl
    wget
    glib
    killall
    inetutils
    pciutils
    usbutils

    gjs
    bun
    cargo
    gcc
    clang
    cmake
    gnumake

    yarn
  ];
}
