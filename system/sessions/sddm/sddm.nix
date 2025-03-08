{
  lib,
  pkgs,
  ...
}: {
  services = {
    displayManager = {
      # sessionPackages = [
      # pkgs.hyprland
      # ];
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        # theme = lib.mkForce "${import ./theme.nix {inherit pkgs;}}";
      };
    };
  };

  environment.systemPackages = with pkgs.kdePackages; [
    qtsvg
    qtmultimedia
    qtvirtualkeyboard
  ];
}
