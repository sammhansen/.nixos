{
  bifrost,
  pkgs,
  ...
}: let
  dotsdir = bifrost.userconf.dotsdir;
  templates = ./templates;
  config = ''
    [config.wallpaper]
    command = "${pkgs.swaybg}/bin/swaybg"
    arguments = ["-i", "{image}", "-m" "fill"]
    set = true


    [templates.nvim]
    input_path = '~/.config/matugen/templates/nvim.lua'
    output_path = '~/.local/state/nvim/colors.lua'

    [templates.colors]
    input_path = '~/.config/matugen/templates/colors.nix'
    output_path = '~/${dotsdir}/.local/state/matugen/colors.nix'

    [templates.clrs]
    input_path = '~/.config/matugen/templates/clrs.nix'
    output_path = '~/${dotsdir}/.clrs.nix'
  '';
in {
  home.packages = with pkgs; [
    matugen
  ];

  xdg.configFile = {
    "matugen/config.toml".text = config;
    "matugen/templates" = {
      recursive = true;
      source = "${templates}";
    };
  };
}
