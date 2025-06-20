{
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer) {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    security.rtkit = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      blueberry
    ];
  };
}
