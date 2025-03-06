{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      nerd-fonts.space-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      material-icons
      material-symbols
      input-fonts
      (pkgs.stdenv.mkDerivation {
        pname = "DankMono Nerd Font";
        version = "1.0";
        src = ../../../../assets/fonts/DankMono.ttf;
        phases = ["installPhase"];
        installPhase = ''
          mkdir -p $out/share/fonts/truetype/NerdFonts/DankMono
          cp $src $out/share/fonts/truetype/NerdFonts/DankMono/DankMono.ttf
        '';
      })
    ];
  };
}
