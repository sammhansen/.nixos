{pkgs, ...}: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
    ];
  };
}
