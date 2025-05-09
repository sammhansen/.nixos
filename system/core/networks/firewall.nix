{...}: {
  networking = {
    firewall = rec {
      enable = true;
      # allowedTCPPorts = [];
      # allowedUDPPorts = [];

      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      # Expo + Metro + Web debugger
      allowedTCPPorts = [8081 19000 19001 19002 19006];
      allowedUDPPorts = [19000 19001];

      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
