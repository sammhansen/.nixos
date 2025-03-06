{...}: {
  imports = [
    ./default.nix
    ../../modules/default.nix
  ];

  nixpkgs.config = {
    input-fonts.acceptLicense = true;
    allowUnfree = true;
  };

  users = {
    mutableUsers = true;
  };

  system.stateVersion = "24.11";
}
