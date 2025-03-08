{pkgs, ...}: {
  virtualisation = {
    libvirtd.enable = false;
    lxd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bottles
    distrobox
  ];
}
