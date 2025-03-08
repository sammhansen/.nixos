{pkgs, ...}: {
  services.ngrok = {
    enable = false;
    extraConfig = {};
    extraConfigFiles = [
      # reference to files containing `authtoken` and `api_key` secrets
      # ngrok will merge these, together with `extraConfig`
    ];
    tunnels = {
      # ...
    };
  };

  environment.systemPackages = with pkgs; [
    # ngrok
  ];
}
