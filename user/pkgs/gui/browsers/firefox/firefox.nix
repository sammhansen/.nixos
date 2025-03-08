{...}: {
  imports = [
    ./extensions.nix
  ];

  programs.firefox = {
    enable = true;

    profiles.default = {
      isDefault = true;
    };
  };
}
