{pkgs, ...}: {
  # temperature target on battery
  services.undervolt = {
    enable = true;
    tempBat = 65; # deg C
    package = pkgs.undervolt;
  };
}
