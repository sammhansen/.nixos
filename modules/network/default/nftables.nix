{...}: {
  networking = {
    nftables = {
      enable = true;
      ruleset = ''
        table ip nat {
            chain PREROUTING {
                type nat hook prerouting priority dstnat; policy accept;
                iifname "ens3" tcp dport 80 dnat to 10.100.0.3:80
            }
        }
      '';
    };
  };
}
