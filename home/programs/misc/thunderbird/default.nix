{
  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
      withExternalGnupg = true;
      settings = {
        "mail.identity.id1.fullName" = "Hansen";
        "mail.identity.id1.useremail" = "samhansen.dev@gmail.com";
      };
    };
    settings = {
      "privacy.donottrackheader.enabled" = true;
    };
  };
}
