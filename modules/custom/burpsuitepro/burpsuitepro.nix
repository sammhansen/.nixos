{
  lib,
  buildFHSEnv,
  fetchurl,
  jdk,
  makeDesktopItem,
  proEdition ? false,
  unzip,
}: let
  version = "2024.11.2";

  productName = "pro";
  productDesktop = "Burp Suite Professional Edition";
  hash = "sha256-VoihG+JjA39wQ1Z7rRwenggwQCNTgg9wgi3vF1tAi6A=";

  src = fetchurl {
    name = "burpsuite.jar";
    urls = [
      "https://portswigger-cdn.net/burp/releases/download?product=${productName}&version=${version}&type=Jar"
      "https://portswigger.net/burp/releases/download?product=${productName}&version=${version}&type=Jar"
      "https://web.archive.org/web/https://portswigger.net/burp/releases/download?product=${productName}&version=${version}&type=Jar"
    ];
    hash = hash;
  };

  pname = "burpsuitepro";
  description = "An integrated platform for performing security testing of web applications";
  desktopItem = makeDesktopItem {
    name = "burpsuitepro";
    exec = pname;
    icon = pname;
    desktopName = productDesktop;
    comment = description;
    categories = [
      "Development"
      "Security"
      "System"
    ];
  };
in
  buildFHSEnv {
    inherit pname version;

    runScript = "${jdk}/bin/java -jar ${src}";

    targetPkgs = pkgs:
      with pkgs; [
        alsa-lib
        at-spi2-core
        cairo
        cups
        dbus
        expat
        glib
        gtk3
        gtk3-x11
        jython
        libcanberra-gtk3
        libdrm
        udev
        libxkbcommon
        libgbm
        nspr
        nss
        pango
        xorg.libX11
        xorg.libxcb
        xorg.libXcomposite
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXrandr
      ];

    extraInstallCommands = ''
      mkdir -p "$out/share/pixmaps"
      ${lib.getBin unzip}/bin/unzip -p ${src} resources/Media/icon64${productName}.png > "$out/share/pixmaps/burpsuite.png"
      echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v${version}.jar &" > ${src}
      cp -r ${desktopItem}/share/applications $out/share
    '';

    meta = with lib; {
      inherit description;
      longDescription = ''
        Burp Suite is an integrated platform for performing security testing of web applications.
        Its various tools work seamlessly together to support the entire testing process, from
        initial mapping and analysis of an application's attack surface, through to finding and
        exploiting security vulnerabilities.
      '';
      homepage = "https://portswigger.net/burp/";
      changelog =
        "https://portswigger.net/burp/releases/professional-community-"
        + replaceStrings ["."] ["-"] version;
      sourceProvenance = with sourceTypes; [binaryBytecode];
      license = licenses.unfree;
      platforms = jdk.meta.platforms;
      hydraPlatforms = [];
      maintainers = with maintainers; [
        bennofs
        fab
      ];
      mainProgram = "burpsuite";
    };
  }
