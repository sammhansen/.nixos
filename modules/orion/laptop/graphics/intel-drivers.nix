{
  lib,
  pkgs,
  config,
  ...
}: {
  services.xserver.videoDrivers = ["modesetting"];
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

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
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
      # mesa.opencl
      # mesa
      # libGL
      # libGLU
      intel-media-sdk
      # vpl-gpu-rt
    ];
  };

  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
}
