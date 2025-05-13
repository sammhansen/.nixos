{pkgs, ...}: let
  pname = "senpwai";
  senpwai = pkgs.python311Packages.buildPythonPackage {
    pname = "${pname}";
    version = "2.1.15";

    src = pkgs.fetchFromGitHub {
      owner = "sammhansen";
      repo = "Senpwai";
      rev = "nix";
      hash = "sha256-IU3vhTO9s7+So16t7NQsna+LNnlNUN8ebpbjpB626SY=";
    };

    format = "pyproject";

    build-system = with pkgs.python311Packages; [
      setuptools
      wheel
      poetry-core
    ];

    nativeBuildInputs = with pkgs; [
      glib
    ];

    propagatedBuildInputs = with pkgs;
      [
        glib
      ]
      ++ (with pkgs; [
        argparse
      ])
      ++ (with pkgs.python311Packages; [
        wheel
        cryptography
        beautifulsoup4
        configargparse
        poetry-core
        requests
        yarl
        anitopy
        appdirs
        tqdm
        pylnk3
        pyqt6
      ]);

    doCheck = true;

    postInstall = ''
      	mkdir -p "$out/share/pixmaps"
      ${pkgs.imagemagick}/bin/magick $src/senpwai/assets/misc/senpwai-icon.ico "$out/share/pixmaps/${pname}.png"
    '';
  };
in {
  home.packages = with pkgs; [
    senpwai

    (makeDesktopItem {
      name = "${pname}";
      desktopName = "Senpwai";
      exec = "${pname}";
      icon = "${pname}";
      terminal = false;
      categories = ["Utility"];
    })
  ];
}
