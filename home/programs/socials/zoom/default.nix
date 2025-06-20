{
  lib,
  pkgs,
  bifrost,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.socials.zoom;

  configuration =
    ''
      [General]
      GeoLocale=system
      SensitiveInfoMaskOn=true
      autoPlayGif=false
      autoScale=true
      bForceMaximizeWM=false
      captureHDCamera=true
      chatListPanelLastWidth=230
      com.disable.connection.pk.status=false
      com.zoom.client.langid=0
      conf.webserver=https://zoom.us
      conf.webserver.vendor.default=https://olxgroup.zoom.us
      disableCef=false
      enable.host.auto.grab=true
      enableAlphaBuffer=true
      enableCefGpu=false
      enableCloudSwitch=true
      enableLog=true
      enableMiniWindow=false
      enableQmlCache=true
      enableScreenSaveGuard=true
      enableStartMeetingWithRoomSystem=false
      enableTestMode=false
      enableWebviewDevTools=false
      enablegpucomputeutilization=false
      flashChatTime=0
      forceEnableTrayIcon=true
      host.auto.grab.interval=10
      isTransCoding=false
      logLevel=info
      newMeetingWithVideo=true
      noSandbox=false
      playSoundForNewMessage=false
      shareBarTopMargin=0
      showOneTimeQAMostUpvoteHubble=true
      showOneTimeTranslationUpSellTip=false
      speaker_volume=255
      sso_domain=.zoom.us
      sso_gov_domain=.zoomgov.com
      supportCefProxyServer=false
      system.audio.type=default
      timeFormat12HoursEnable=false
      transcodingUI=true
      translationFreeTrialTipShowTime=0
      upcoming_meeting_header_image=
      useSystemTheme=false
      userEmailAddress="samhansen.dev@gmail.com"

      [AS]
      showframewindow=true

      [CodeSnippet]
      lastCodeType=0
      wrapMode=0

      [tooltip]
      cmcPostMeetingTipShownTimes=5

      [zoom_new_im]
      is_landscape_mode=true
    ''
    + (mkIf isWayland ''
      enableWaylandShare=true
      xwayland=true
    '');
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      zoom-us
    ];
    xdg.configFile."zoomus.conf".text = configuration;
  };
}
