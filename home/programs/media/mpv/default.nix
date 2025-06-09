{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris
      mpv-discord
    ];
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      gpu-context = "wayland";
      profile = "gpu-hq";
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}
