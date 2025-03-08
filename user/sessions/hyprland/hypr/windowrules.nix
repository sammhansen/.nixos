{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "opacity 0.92 override 0.93 override, .*" # Applies transparency to EVERY WINDOW
      "float, ^(steam)$"
      "float, polkit-gnome-authentication-agent-1"
      "size 300 300, polkit-gnome-authentication-agent-1"
      "float, Genymotion Player"
      "float, Volume Control"
      "float, title:^(Smile)$"
      "float, ^(blueberry.py)$"
      "pin, ^(showmethekey-gtk)$"
      "float,title:^(Open File)(.*)$"
      "float,title:^(Select a File)(.*)$"
      "float,title:^(Choose wallpaper)(.*)$"
      "float,title:^(Open Folder)(.*)$"
      "float,title:^(Save As)(.*)$"
      "float,title:^(Library)(.*)$ "
    ];

    layerrule = [
      "xray 1, .*"
      "blur, swaylock"
      "ignorealpha 1, gtk-layer-shell"
    ];
  };
}
