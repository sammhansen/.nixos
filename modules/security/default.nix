{ pkgs, ...}: {
  imports = [
    ./polkit.nix
    ./wireshark.nix
  ];

	hardware.trackpoint.enable = true;
  hardware.trackpoint.emulateWheel = true;

  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
}
