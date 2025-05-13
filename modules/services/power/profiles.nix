{pkgs, ...}: {
  services.power-profiles-daemon = {
    enable = true;
    package = pkgs.power-profiles-daemon;
  };

  environment.systemPackages = with pkgs; [
    powermode-indicator
  ];
}
