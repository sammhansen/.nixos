{pkgs, ...}: {
  home.packages = with pkgs; [
    xfce.thunar
    # hakuneko
    walker
    blender
    davinci-resolve
  ];
}
