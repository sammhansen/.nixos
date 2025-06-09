{
  username,
  bifrost,
  ...
}: let
  font = bifrost.themes.font.name;
in {
  home.file.".config/Senpwai/settings.json".text = ''
    {
      "sub_or_dub": "sub",
      "quality": "1080p",
      "download_folder_paths": [
        "/home/${username}/Documents/Anime"
      ],
      "max_simultaneous_downloads": 1,
      "font_family": "${font}",
      "allow_notifications": true,
      "start_maximized": true,
      "run_on_startup": false,
      "gogo_mode": "norm",
      "tracked_anime": [],
      "tracking_site": "pahe",
      "tracking_interval_hrs": 24,
      "version": "2.1.15",
      "close_minimize_to_tray": true,
      "max_part_size_mbs": 0,
      "custom_anime_folders": []
    }
  '';
}
