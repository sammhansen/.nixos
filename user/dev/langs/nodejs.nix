{ config, lib, pkgs, ...}: let
  inherit (lib.modules) mkIf
in {

	config = {
home.packages = with pkgs;
  with nodePackages; [
    ts-node
    nodejs
  ];

	};
  }
