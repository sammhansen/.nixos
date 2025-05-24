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
    virtualisation = {
      libvirtd = {
        enable = true;
      };
      spiceUSBRedirection.enable = true;
      lxd.enable = false;
    };

    programs.virt-manager.enable = true;

    users = {
      users.${username}.extraGroups = [
        "kvm"
        # "libvirtd"
      ];
      groups.libvirtd.members = ["${username}"];
    };

    environment.systemPackages = with pkgs; [
      distrobox
      dnsmasq
      nftables
      iptables
    ];
  };
}
