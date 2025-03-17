{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ntfs3g
    nfs-utils
  ];
}
