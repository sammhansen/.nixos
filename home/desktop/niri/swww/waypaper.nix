{
  lib,
  pkgs,
  bifrost,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;

  walDir = bifrost.device.walDir;
  settings = ''
    [Settings]
    language = en
    folder = ${walDir}
    monitors = All
    wallpaper = ${walDir}
    show_path_in_tooltip = True
    backend = swww
    fill = fill
    sort = name
    color = #ffffff
    subfolders = False
    all_subfolders = False
    show_hidden = False
    show_gifs_only = False
    post_command = ${pkgs.matugen}/bin/matugen image $wallpaper;
    number_of_columns = 3
    mpvpaper_sound = False
    mpvpaper_options =
    use_xdg_state = False
  '';
in {
  config = mkIf (!isServer && isWayland) {
    home.packages = with pkgs; [
      waypaper
    ];

    xdg.configFile."waypaper/config.ini".text = settings;
  };
}
