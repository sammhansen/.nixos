{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShell.${system} = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        dotnet-sdk_9
        dotnet-runtime_9
      ];
    };
  };
}
