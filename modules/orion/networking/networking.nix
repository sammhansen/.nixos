{
  pkgs,
  host,
  options,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
    };

    hostName = "${host}";

    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
    nameservers = ["8.8.8.8" "8.8.4.4"];
  };

  environment.systemPackages = with pkgs; [
    openvpn
  ];
}
