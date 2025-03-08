{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    ruby
    python312Full
    openjdk23
    go
  ];
}
