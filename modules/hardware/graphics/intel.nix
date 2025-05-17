{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf bifrost.hardware.intel.enable {
    services.xserver.videoDrivers = ["intel"];
    hardware.cpu.intel.updateMicrocode = true;
    hardware.enableRedistributableFirmware = true;

    boot.kernelParams = [
      "i915.enable_guc=2"
    ];

    # VP9 decoding not supported when using intel-media-driver
    # https://github.com/intel/media-driver/issues/1024
    # NixOS Wiki recommends using the legacy intel-vaapi-driver with the hybrid codec over that one for Skylake.
    # https://wiki.nixos.org/wiki/Accelerated_Video_Playback
    # hardware.graphics = {
    #   vaapiDriver = "intel-vaapi-driver";
    #   enableHybridCodec = true;
    # };

    nixpkgs.config.packageOverrides = pkgs: {
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # intel-ocl
        # vaapiIntel
        # vaapiVdpau
        # libvdpau-va-gl
        vulkan-loader
        vulkan-tools
        vulkan-validation-layers
        libGL

        intel-media-driver
        intel-vaapi-driver
        libvdpau-va-gl
        # mesa.opencl
        mesa
        # libGL
        # libGLU
        intel-media-sdk
        # vpl-gpu-rt
      ];
    };

    environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
  };
}
