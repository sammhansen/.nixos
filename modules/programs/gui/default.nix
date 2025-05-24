{pkgs, ...}: {
  imports = [
    ./browsers
  ];
  environment.systemPackages = with pkgs; [
    impression
  ];
}
