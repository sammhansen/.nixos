{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options = {
    bifrost = {
      virtualisation = {
        enable = mkEnableOption "virtualisation";
        libvirt = {
          enable = mkEnableOption "libvirt";
        };
        bottles.enable = mkEnableOption "bottles";
        distrobox = {
          enable = mkEnableOption "distrobox";
        };
        podman = {
          enable = mkEnableOption "podman";
        };
        docker = {
          enable = mkEnableOption "docker";
        };
        ollama = {
          enable = mkEnableOption "ollama";
        };
        waydroid = {
          enable = mkEnableOption "waydroid";
        };
      };
    };
  };
}
