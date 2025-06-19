{
  config,
  lib,
  pkgs,
  username,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.virtualisation.libvirt;
in {
  imports = [
    ./docker.nix
    ./podman.nix
    ./ollama.nix
    ./bottles.nix
    ./waydroid.nix
  ];

  config = mkIf (!isServer && cfg.enable) {
    boot.extraModprobeConfig = "options kvm_intel nested=1";

    virtualisation = {
      libvirtd = {
        enable = true;
        #enable tpm emulation
        qemu = {
          swtpm.enable = true;
          ovmf.packages = [pkgs.OVMFFull.fd];
        };
      };
      spiceUSBRedirection.enable = true;
      lxd.enable = false;
    };

    programs.virt-manager.enable = true;

    users = {
      users.${username}.extraGroups = [
        "kvm"
      ];
      groups.libvirtd.members = ["${username}"];
    };

    environment.systemPackages = with pkgs; [
      # lmstudio
      dnsmasq #required for virt-manager
    ];
  };
}
