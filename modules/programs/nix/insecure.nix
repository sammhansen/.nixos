{pkgs, ...}: {
  nixpkgs.config.permittedInsecurePackages = [
    "qbittorrent-4.6.4"
  ];

  environment.systemPackages = with pkgs; [
    qbittorrent # Potential Remote Code Execution https://www.openwall.com/lists/oss-security/2024/10/30/4
  ];
}
