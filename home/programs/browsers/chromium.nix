{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.lists) concatLists;
  inherit (lib.strings) enableFeature;
  cfg = bifrost.browsers.brave;
in {
  config = mkIf cfg.enable {
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

      package = pkgs.brave.override {
        # enableWideVine = true;
        commandLineArgs = concatLists [
          [
            "--force-dark-mode"
            "--gtk-version=4"
          ]

          # [
          #   (enableFeature true "gpu-rasterization")
          #   (enableFeature true "oop-rasterization")
          #   (enableFeature true "zero-copy")
          #   "--ignore-gpu-blocklist"
          # ]

          [
            "--ozone-platform=wayland"
            "--enable-features=UseOzonePlatform"
          ]

          [
            "--no-default-browser-check"

            (enableFeature false "speech-api")
            (enableFeature false "speech-synthesis-api")
          ]
        ];
      };
    };
  };
}
