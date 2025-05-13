{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
  ];

  programs.hyfetch = {
    enable = true;
    package = pkgs.hyfetch;

    settings = {
      preset = "transgender";
      mode = "rgb";
      light_dark = "dark";
      lightness = 0.56;
      color_align = {
        mode = "horizontal";
        custom_colors = [];
        fore_back = null;
      };
      backend = "fastfetch";
      distro = "nixos";
      pride_month_shown = [];
      pride_month_disable = true;
    };
  };
}
