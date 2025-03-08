{pkgs, ...}: {
  home.packages = with pkgs; [
    gcolor3
    postman
  ];
}
