{
  lib,
  pkgs,
  bifrost,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib) mkIf optionals concatLists enableFeature;

  cfg = bifrost.programs.browsers.brave;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.brave = {
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
        commandLineArgs =
          (concatLists [
            [
              "--no-default-browser-check"
              "--disable-features=native-brave-wallet"

              (enableFeature true "smooth-scrolling")
              (enableFeature true "enable-force-dark")
              (enableFeature true "enable-parallel-downloading")

              (enableFeature false "native-brave-wallet")
              (enableFeature false "brave-wallet-zcash")
              (enableFeature false "brave-wallet-bitcoin")
              (enableFeature false "brave-wallet-enable-ankr-balances")
              (enableFeature false "brave-wallet-enable-transaction-simulations")
              (enableFeature false "ethereum_remote-client_new-installs")
              (enableFeature false "brave-ai-chat")
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
