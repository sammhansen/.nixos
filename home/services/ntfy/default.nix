{pkgs, ...}: {
  home.packages = with pkgs; [
    # ntfy
    ntfy-sh
  ];
}
