{
  lib,
  pkgs,
  isIntel,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf isIntel {
    services.xserver.videoDrivers = ["intel"];
    hardware.cpu.intel.updateMicrocode = true;
    hardware.enableRedistributableFirmware = true;

    nixpkgs.config.packageOverrides = pkgs: {
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vulkan-loader
        vulkan-tools
        vulkan-validation-layers
        libGL
        intel-media-driver
        intel-vaapi-driver
        libvdpau-va-gl
        mesa
        intel-media-sdk
      ];
    };

    environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
  };
}
