{
  description = "Python development environment with uv (github.com/astral-sh/uv), requiring FHS.";
  # Credit/inspiration/reference: https://www.alexghr.me/blog/til-nix-flake-fhs/

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    fhs = pkgs.buildFHSEnv {
      name = "fhs-shell";
      targetPkgs = pkgs:
        with pkgs; [
          uv
          zlib # required to make numpy work -- specifically, the error is `ImportError: libstdc++.so.6`
          expat # required for rasterio (which is required by rioxarray) -- specifically, the error is `ImportError: libexpat.so.1`
          just # task-runner, see associated '.justfile'
        ];
    };
  in {
    devShells.${system}.default = fhs.env;
  };
}
