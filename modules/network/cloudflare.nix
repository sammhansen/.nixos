{pkgs, ...}: {
  systemd = {
    packages = [pkgs.cloudflare-warp];
    services."warp-svc".wantedBy = ["multi-user.target"];
    user.services."warp-taskbar".wantedBy = ["tray.target"];
  };

  environment.systemPackages = with pkgs; [
    cloudflare-warp
  ];
}
