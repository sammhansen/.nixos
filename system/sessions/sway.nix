{pkgs, ...}: {
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    xwayland.enable = true;
  };
}
