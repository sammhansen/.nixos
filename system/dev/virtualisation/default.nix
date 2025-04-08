{...}: {
  imports = [
    ./virtualisation.nix
    ./podman.nix
    ./docker.nix
    ./ollama.nix
    ./waydroid.nix
  ];
}
