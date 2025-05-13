{pkgs, ...}: {
  # services.swww = {
  #   enable = true;
  # };
  home.packages = with pkgs; [
    swww
  ];
}
