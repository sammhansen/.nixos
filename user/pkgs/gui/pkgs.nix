{pkgs, ...}: {
  home.packages = with pkgs; [
    hakuneko
  ];
}
