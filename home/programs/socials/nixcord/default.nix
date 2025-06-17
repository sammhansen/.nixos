{
  imports = [
    ./midnight.nix
  ];

  programs.nixcord = {
    enable = true;
    discord = {
      enable = false;
    };
    vesktop = {
      enable = true;
    };
    config = {
      enabledThemes = ["midnight"];
      plugins = {
        iLoveSpam.enable = true;
        memberCount = {
          enable = true;
          toolTip = true;
          memberList = true;
        };
        mutualGroupDMs = {
          enable = true;
        };
        oneko.enable = true;
        spotifyControls = {
          enable = true;
        };
        fakeNitro = {
          enable = true;
          enableEmojiBypass = true;
          emojiSize = 48;
          transformEmojis = true;
          enableStickerBypass = true;
          stickerSize = 160;
          transformStickers = true;
          enableStreamQualityBypass = true;
        };
      };
    };
  };
}
