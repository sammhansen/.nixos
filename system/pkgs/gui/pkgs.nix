{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    davinci-resolve
    shotcut
    kdePackages.kdenlive
  ];
}
