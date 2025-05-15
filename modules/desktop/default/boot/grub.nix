{
  bifrost,
  inputs,
  system,
  ...
}: let
  cfg = bifrost.sysconf.osprober;
in {
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
      theme = inputs.distro-grub-themes.packages.${system}.thinkpad-grub-theme;
    };
  };
}
