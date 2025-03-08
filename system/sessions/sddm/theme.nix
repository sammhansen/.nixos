{pkgs}: let
  imgLink = "https://img.freepik.com/free-photo/morskie-oko-tatry_1204-510.jpg";
  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "05g7zk10li2d2qfzxlrp16cvh5lbi0vs7lz9wwsvp9li35i21w6n";
  };

  theme_path = "$out/";
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-astronaut-theme";
    src = pkgs.fetchFromGitHub {
      owner = "sammhansen";
      repo = "sddm-nixos";
      rev = "5e39e0841d4942757079779b4f0087f921288af6";
      sha256 = "09vi9dr0n0bhq8cj4jq1h17jw2ssi79zi9lhn0j6kgbxrqk2g8vf";
    };
    installPhase = ''
      mkdir -p ${theme_path}
      cp -R ./* ${theme_path}/
    '';
  }
