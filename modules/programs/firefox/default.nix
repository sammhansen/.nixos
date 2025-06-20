{
  lib,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.programs.browsers.firefox;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.firefox = {
      enable = true;
      nativeMessagingHosts.ugetIntegrator = true;
    };
  };
}
