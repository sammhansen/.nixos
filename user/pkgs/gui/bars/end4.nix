{
  username,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home = {
    sessionVariables = {
      ILLOGICAL_IMPULSE_VIRTUAL_ENV = "/home/${username}/.local/state/ags/venv";
    };
    packages = with pkgs; [
      morewaita-icon-theme
      ollama
      pywal
      sassc
      sass
      material-symbols
      material-icons
      gtksourceview
      gtksourceview4
      gsettings-desktop-schemas
      matugen
      swayidle
      google-fonts
      ddcutil
      (python312.withPackages (p: [
        p.materialyoucolor
        p.pillow
        p.setproctitle
        p.pywayland
      ]))
    ];
  };

  programs.ags = {
    enable = true;
    configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ./../.config/ags;

    extraPackages = with pkgs; [
      gtksourceview
      ddcutil
      material-symbols
      material-icons
      matugen
      gtksourceview4
      gsettings-desktop-schemas
      ollama
      pywal
      sassc
      sass
      webkitgtk
      swayidle
      webp-pixbuf-loader
      ydotool
      bc
      ddcutil
      blueberry
      (python312.withPackages (p: [
        p.materialyoucolor
        p.pillow
        p.setproctitle
        p.pywayland
      ]))
    ];
  };
}
