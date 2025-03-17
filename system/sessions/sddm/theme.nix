{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "whoslucifer";
    repo = "SDDM-NIX";
    rev = "f1943c2247244b1328a406f818dec1285c4366d1";
    sha256 = "125lvlcldfvr09fi5gaanjjz4m5270syrs6k4gf4ch06wzcqf842";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
