{pkgs, ...}: {
  environment.systemPackages = with pkgs;
  with nodePackages_latest;
  with libsForQt5; [
    d-spy
    icon-library
    dconf-editor
    qt5.qtimageformats

    # protonvpn-gui

    acpi
    ffmpeg

    libnotify
    gobject-introspection

    # langs
    gjs
    bun
    cargo
    #typescript
    # eslint

    shadps4
    curl
    wget
    glib
    killall
    pciutils
    usbutils
  ];
}
