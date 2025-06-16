{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = false;
      defaultNetwork.settings.dns_enabled = false;
    };
  };
  environment.systemPackages = with pkgs; [
    podman-desktop
  ];
}
