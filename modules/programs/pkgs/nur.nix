{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nur.repos.mic92.hello-nur
  ];
}
