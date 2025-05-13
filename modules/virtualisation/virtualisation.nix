{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.virtualisation;
in {
  config = mkIf cfg.enable {
    virtualisation = {
      libvirtd.enable = false;
      lxd.enable = false;
    };

    environment.systemPackages = with pkgs; [
      distrobox
    ];
  };
}
