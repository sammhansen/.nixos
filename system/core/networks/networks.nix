{
  pkgs,
  host,
  options,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      plugins = [pkgs.networkmanager-openvpn];
    };

    hostName = "${host}";

    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
    nameservers = ["8.8.8.8" "8.8.4.4"];
  };
}
