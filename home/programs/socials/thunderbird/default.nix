{
  config,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.socials.thunderbird;
  name = cfg.user.name;
  email = cfg.programs.git.userEmail;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.thunderbird = {
      enable = true;
      profiles.default = {
        isDefault = true;
        withExternalGnupg = true;
        settings = {
          "mail.identity.id1.fullName" = "${name}";
          "mail.identity.id1.useremail" = "${email}";
        };
      };
      settings = {
        "privacy.donottrackheader.enabled" = true;
      };
    };
  };
}
