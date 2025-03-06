{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    bun
    hyprpicker
    hyprshade
    sass
    zenity
    material-icons
  ];

  programs.ags = {
    enable = true;

    configDir = null;

    extraPackages = with pkgs;
      [
        fzf
        libgtop
        gtksourceview
        # webkitgtk
        webkitgtk_4_0
        accountsservice
      ]
      ++ (map (component: inputs.ags.packages.${pkgs.system}.${component}) [
        "hyprland"
        "mpris"
        "battery"
        "bluetooth"
        "network"
        "tray"
        "notifd"
        "wireplumber"
        # sash
        "cava"
        "greet"
        "apps"
        "river"
        "powerprofiles"
        "auth"
        "astal4"
        "astal3"
      ]);
  };
}
