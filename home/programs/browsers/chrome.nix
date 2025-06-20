{
  lib,
  pkgs,
  bifrost,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib) optionals mkIf concatLists enableFeature;

  cfg = bifrost.programs.browsers.chrome;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.chromium = {
      enable = true;
      extensions = [
        "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin lite
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
        "emffkefkbkpkgpdeeooapgaicgmcbolj" # Wikiwand
        "mmpljcghnbpkokhbkmfdmoagllopfmlm" # Allow copy & enable right click
        "ccjfggejcoobknjolglgmfhoeneafhhm" # ChatGPT to pdf
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader
        "gcknhkkoolaabfmlnjonogaaifnjlfnp" # Foxyproxy
        "mljepckcnbghmcdmaebjhejiplcngbkm" # Hide scrollbar
        "gabfmnliflodkdafenbcpjdlppllnemd" # save image as
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
        "kapjaoifikajdcdehfdlmojlepfpkpoe" # squarex
        "gppongmhjkpfnbhagpmjfkannfbllamg" # wappalyzer
      ];

      package = pkgs.google-chrome.override {
        commandLineArgs =
          (concatLists [
            [
              "--force-dark-mode"
              "--gtk-version=4"

              "--no-default-browser-check"

              (enableFeature false "speech-api")
              (enableFeature false "speech-synthesis-api")
            ]
          ])
          ++ (optionals isWayland [
            "--ozone-platform=wayland"
            "--enable-features=UseOzonePlatform"
          ]);
      };
    };
  };
}
