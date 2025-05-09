{
  description = "A flake for react-native development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux.default;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        nodejs
      ];

      shellHook = ''
        # npx create-expo-app@latest --template blank ./ ;
        npx expo start
      '';
    };
  };
}
