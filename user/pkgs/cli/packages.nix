{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-output-monitor
    wakatime-cli
    jq #json parser
    yq #yaml parser
  ];
}
