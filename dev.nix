{
  bifrost = {
    dev = {
      enable = true;

      editors = {
        vscode.enable = true;
        zeditor.enable = false;
      };
      ides = {
        android_studio.enable = false;
      };
      langs = {
        nodejs.enable = false;
      };
    };

    virtualisation = {
      distrobox = {
        kali.hostname = "kali";
      };
      podman.enable = false;
      docker.enable = false;
      ollama.enable = false;
      waydroid.enable = false;
      emulator.enable = false;
    };

    pentester = {
      enable = true;
    };
  };
}
