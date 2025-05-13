{...}: {
  imports = [
    ./virtualisation.nix
    ./bottles.nix
    ./podman.nix
    ./docker.nix
    ./ollama.nix
    ./waydroid.nix
  ];
}
