{
  bifrost,
  system,
  lib,
  inputs,
  ...
}: let
  inherit (lib.modules) mkForce;
  cfg = bifrost.sysconf.osprober;
in {
  imports = [
    inputs.minegrub-theme.nixosModules.default
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = ["nodev"];
      efiSupport = true;
      enable = true;
      useOSProber = cfg;
      theme = mkForce inputs.distro-grub-themes.packages.${system}.thinkpad-grub-theme;
    };
  };
}
