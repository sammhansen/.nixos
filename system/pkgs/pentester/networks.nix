{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    hashcat
    hashcat-utils
    hcxtools
    hcxdumptool
    
    netdiscover
    
  ];
}
