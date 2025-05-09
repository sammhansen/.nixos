{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "sammhansen";
    repo = "nixos-sddm-theme";
    rev = "94c72eda87f702bfa77750ea5bf2b2715944124a";
    sha256 = "1c8y09r6bsrx7gyygwa42kgr0py1sps5hlg5kgam2jh95nks62xh";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
