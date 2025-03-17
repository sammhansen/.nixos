{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    ollama
    pywal
    sassc
    material-symbols
    material-icons
    sass
    #blueberry
    gtksourceview
    gtksourceview4
    #cloudflare-warp
    gsettings-desktop-schemas
    matugen
    swayidle
    ddcutil
    #materialyoucolor
    (python312.withPackages (p: [
      p.materialyoucolor
      p.setproctitle
      p.pywayland
    ]))
  ];

  programs.ags = {
    enable = true;
    configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ./../.config/ags;

    extraPackages = with pkgs; [
      #hicolor-icon-theme
      gtksourceview
      material-symbols
      material-icons
      matugen
      gtksourceview4
      gsettings-desktop-schemas
      ollama
      pywal
      sassc
      ddcutil
      webkitgtk
      swayidle
      webp-pixbuf-loader
      ydotool
    ];
  };
}
