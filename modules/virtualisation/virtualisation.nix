{
  username,
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.virtualisation;
in {
  config = mkIf cfg.enable {
    users.users.${username}.extraGroups = [
      "libvirtd"
      "kvm"
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
        allowedBridges = ["virbr0"];
      };
      lxd.enable = false;
    };

    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      distrobox
      libvirt-glib
    ];
  };
}
