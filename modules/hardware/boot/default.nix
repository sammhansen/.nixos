{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./grub.nix
  ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;

    kernelPackages = let
      apply = _: prevModules: {
        v4l2loopback =
          if lib.strings.hasPrefix "0.13.2" prevModules.v4l2loopback.version
          then
            prevModules.v4l2loopback.overrideAttrs (_: rec {
              version = "0.15.0";
              src = pkgs.fetchFromGitHub {
                owner = "umlaeute";
                repo = "v4l2loopback";
                rev = "v${version}";
                hash = "sha256-fa3f8GDoQTkPppAysrkA7kHuU5z2P2pqI8dKhuKYh04=";
              };
            })
          else prevModules.v4l2loopback;
      };
    in
      pkgs.linuxPackages_latest.extend apply;

    kernelModules = ["v4l2loopback" "i2c-dev"];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];

    supportedFilesystems = ["ntfs"];

    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = ["i915"];
    };
  };
}
