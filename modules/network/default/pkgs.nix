{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    openvpn
  ];
}
