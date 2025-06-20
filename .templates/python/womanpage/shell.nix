{pkgs ? import <nixpkgs> {}}:
(pkgs.buildFHSEnv {
  name = "pipzone";
  targetPkgs = pkgs: (with pkgs; [
    python312
    python312Packages.pip
    python312Packages.virtualenv
    python312Packages.wheel
    zlib #libstdc++.so.6
    expat #libexpat.so.1
    zstd #libzstd.so.1
    glib #libglib-2.0.so.0
    libGL #libGL.so.1
    fontconfig #libfontconfig.so.1
    xorg.libX11 #libX11.so.6
    libxkbcommon #libxkbcommon.so.0
    freetype #libfreetype.so.6
    dbus #libdbus-1.so.3
    pulseaudio #libpulse.so.0
    krb5 #libgssapi_krb5.so.2
    nss #libnss3.so
    nspr #libnspr4.so
    xorg.libxc #libxcb.so.1:
  ]);
  runScript = "fish";
})
.env
