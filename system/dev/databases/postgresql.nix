{pkgs, ...}: {
  # postgresql
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;
    # dataDir = "/data/postgresql";
  };

  environment.systemPackages = with pkgs; [
  ];
}
