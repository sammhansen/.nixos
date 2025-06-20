{pkgs, ...}: {
  systemd = {
    packages = [pkgs.cloudflare-warp];
    services."warp-svc".wantedBy = ["multi-user.target"];
  };

  environment.systemPackages = with pkgs; [
    cloudflare-warp
  ];
}
