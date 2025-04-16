{
  bifrost,
  inputs,
  system,
  lib,
  ...
}: let
  cfg = bifrost.sysconf.osprober;
in {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = ["nodev"];
      efiSupport = true;
      enable = true;
      useOSProber = cfg;
      theme = lib.mkForce inputs.distro-grub-themes.packages.${system}.thinkpad-grub-theme;
    };
  };
}
