{
  inputs,
  pkgs,
  ...
}: let
  system = "x86_64-linux";
in {
  environment.systemPackages = with pkgs; [
    # ...
    inputs.matugen.packages.${system}.default
  ];
}
