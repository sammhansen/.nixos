{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-gstreamer
      obs-vaapi
      obs-vkcapture
    ];
  };
}
