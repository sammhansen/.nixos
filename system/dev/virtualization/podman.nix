{...}: {
  virtualisation = {
    podman = {
      enable = false;
      dockerCompat = false;
      defaultNetwork.settings.dns_enabled = false;
    };

    docker = {
      enable = true;
    };
  };
}
