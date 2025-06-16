{
  pkgs,
  host,
  options,
  ...
}: {
  imports = [
    ./hosts.nix
    ./firewall.nix
    ./nat.nix
    ./nftables.nix
    ./cloudflare.nix
    ./vpn.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [networkmanager-openvpn];
    };

    hostName = "${host}";

    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    openvpn
  ];
}
