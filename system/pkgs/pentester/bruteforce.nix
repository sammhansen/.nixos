{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wordlists
    seclists
    rockyou

    crunch
    # cewl
    thc-hydra
  ];
}
