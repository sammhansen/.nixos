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

    curl
    wget
    glib
    killall
    pciutils
    usbutils

    gjs
    bun
    cargo
  ];
}
