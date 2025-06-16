{pkgs, ...}: let
  config = ''
    [Settings]
    language = en
    folder = ~/Pictures/wallpapers
    monitors = All
    wallpaper = ~/Pictures/
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
  home.packages = with pkgs; [
    waypaper
  ];

  home.file.".config/waypaper/config.ini".text = config;
}
