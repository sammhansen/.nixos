{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    # This is for OBS Virtual Cam Support
    kernelModules = ["v4l2loopback" "i2c-dev"];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];

    supportedFilesystems = ["ntfs"];

    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = ["i915"];
    };

    tmp = {
      useTmpfs = false;
      tmpfsSize = "30%";
    };
  };
}
