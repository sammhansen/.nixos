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
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
