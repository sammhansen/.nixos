{
  inputs,
  system,
  lib,
  ...
}: {
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
      useOSProber = true;
      theme = lib.mkForce inputs.distro-grub-themes.packages.${system}.thinkpad-grub-theme;
    };
  };
}
