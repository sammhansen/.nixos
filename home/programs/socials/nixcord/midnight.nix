{
  config,
  lib,
  isServer,
  colors,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.socials.nixcord;

  theme = ''
    /**
     * @name midnight
     * @description a dark, customizable discord theme.
     * @author refact0r
     * @version 2.1.1
     * @invite nz87hXyvcy
     * @website https://github.com/refact0r/midnight-discord
     * @source https://github.com/refact0r/midnight-discord/blob/master/themes/midnight.theme.css
     * @authorId 508863359777505290
     * @authorLink https://www.refact0r.dev
    */

    /* import theme modules */
    @import url("https://refact0r.github.io/midnight-discord/build/midnight.css");

    body {
      /* font options */
      /* --font: "figtree"; /* change to  for default discord font */
      --font: "SpaceMono Nerd Font";
      --code-font: "SpaceMono Nerd Font"; /* change to  for default discord font */
      font-weight: 400; /* normal text font weight. DOES NOT AFFECT BOLD TEXT */

      /* sizes */
      --gap: 8px; /* spacing between panels */
      --divider-thickness: 4px; /* thickness of unread messages divider and highlighted message borders */
      --border-thickness: 1px; /* thickness of borders around main panels. DOES NOT AFFECT OTHER BORDERS */

      /* animation/transition options */
      --animations: on; /* off: disable animations/transitions, on: enable animations/transitions */
      --list-item-transition: 0.2s ease; /* transition for list items */
      --dms-icon-svg-transition: 0.4s ease; /* transition for the dms icon */
      --border-hover-transition: 0.2s ease; /* transition for borders when hovered */

      /* corner roundness (border-radius) */
      --radius-lg: 4px;
      --radius-md: 2px;
      --radius-sm: 1px;

      /* top bar options */
      --top-bar-height: var(
        --gap
      ); /* height of the top bar (discord default is 36px, old discord style is 24px, var(--gap) recommended if button position is set to titlebar) */
      --top-bar-button-position: titlebar; /* off: default position, hide: hide buttons completely, serverlist: move inbox button to server list, titlebar: move inbox button to channel titlebar (will hide title) */
      --top-bar-title-position: off; /* off: default centered position, hide: hide title completely, left: left align title (like old discord) */
      --subtle-top-bar-title: off; /* off: default, on: hide the icon and use subtle text color (like old discord) */

      /* window controls */
      --custom-window-controls: on; /* off: default window controls, on: custom window controls */
      --window-control-size: 14px; /* size of custom window controls */

      /* dms button options */
      --custom-dms-icon: custom; /* off: use default discord icon, hide: remove icon entirely, custom: use custom icon */
      --dms-icon-svg-url: url("https://refact0r.github.io/midnight-discord/assets/Font_Awesome_5_solid_moon.svg"); /* icon svg url. MUST BE A SVG. */
      --dms-icon-svg-size: 90%; /* size of the svg (css mask-size property) */
      --dms-icon-color-before: var(--icon-secondary); /* normal icon color */
      --dms-icon-color-after: var(
        --white
      ); /* icon color when button is hovered/selected */
      --custom-dms-background: off; /* off to disable, image to use a background image (must set url variable below), color to use a custom color/gradient */
      --dms-background-image-url: url(""); /* url of the background image */
      --dms-background-image-size: cover; /* size of the background image (css background-size property) */
      --dms-background-color: linear-gradient(
        70deg,
        var(--blue-2),
        var(--purple-2),
        var(--red-2)
      ); /* fixed color/gradient (css background property) */

      /* background image options */
      --background-image: off; /* off: no background image, on: enable background image (must set url variable below) */
      --background-image-url: url(""); /* url of the background image */

      /* transparency/blur options */
      /* NOTE: TO USE TRANSPARENCY/BLUR, YOU MUST HAVE TRANSPARENT BG COLORS. FOR EXAMPLE: --bg-4: hsla(220, 15%, 10%, 0.7); */
      --transparency-tweaks: off; /* off: no changes, on: remove some elements for better transparency */
      --remove-bg-layer: off; /* off: no changes, on: remove the base --bg-3 layer for use with window transparency (WILL OVERRIDE BACKGROUND IMAGE) */
      --panel-blur: off; /* off: no changes, on: blur the background of panels */
      --blur-amount: 12px; /* amount of blur */
      --bg-floating: var(
        --bg-3
      ); /* set this to a more opaque color if floating panels look too transparent. only applies if panel blur is on  */

      /* chatbar options */
      --custom-chatbar: aligned; /* off: default chatbar, aligned: chatbar aligned with the user panel, separated: chatbar separated from chat */
      --chatbar-height: 47px; /* height of the chatbar (52px by default, 47px recommended for aligned, 56px recommended for separated) */
      --chatbar-padding: 8px; /* padding of the chatbar. only applies in aligned mode. */

      /* other options */
      --small-user-panel: on; /* off: default user panel, on: smaller user panel like in old discord */
    }

    /* color options */
    :root {
      --colors: on; /* off: discord default colors, on: midnight custom colors */

      /* text colors */
      --text-0: ${colors.surface.hex}; /* text on colored elements */
      --text-1: ${colors.on_surface.hex}; /* other normally white text */
      --text-2: ${colors.on_surface.hex}; /* headings and important text */
      --text-3: ${colors.on_surface_variant.hex}; /* normal text */
      --text-4: ${colors.on_surface_variant.hex}; /* icon buttons and channels */
      --text-5: ${colors.outline.hex}; /* muted channels/chats and timestamps */

      /* background and dark colors */
      --bg-1: ${colors.primary.hex}; /* dark buttons when clicked */
      --bg-2: ${colors.surface_container_high.hex}; /* dark buttons */
      --bg-3: ${colors.surface_container_low.hex}; /* spacing, secondary elements */
      --bg-4: ${colors.background.hex}; /* main background color */
      --hover: ${colors.surface_bright.hex}; /* channels and buttons when hovered */
      --active: ${colors.surface_bright.hex}; /* channels and buttons when clicked or selected */
      --active-2: ${colors.surface_bright.hex}; /* extra state for transparent buttons */
      --message-hover: ${colors.surface_bright.hex}; /* messages when hovered */

      /* accent colors */
      --accent-1: ${colors.tertiary.hex}; /* links and other accent text */
      --accent-2: ${colors.primary.hex}; /* small accent elements */
      --accent-3: ${colors.primary_container.hex}; /* accent buttons */
      --accent-4: ${colors.surface_bright.hex}; /* accent buttons when hovered */
      --accent-5: ${colors.primary_fixed_dim.hex}; /* accent buttons when clicked */
      --accent-new: var(
        --accent-2
      ); /* stuff that's normally red like mute/deafen buttons */
      --mention: linear-gradient(
        to right,
        color-mix(in hsl, var(--accent-2), transparent 90%) 40%,
        transparent
      ); /* background of messages that mention you */
      --mention-hover: linear-gradient(
        to right,
        color-mix(in hsl, var(--accent-2), transparent 95%) 40%,
        transparent
      ); /* background of messages that mention you when hovered */
      --reply: linear-gradient(
        to right,
        color-mix(in hsl, var(--text-3), transparent 90%) 40%,
        transparent
      ); /* background of messages that reply to you */
      --reply-hover: linear-gradient(
        to right,
        color-mix(in hsl, var(--text-3), transparent 95%) 40%,
        transparent
      ); /* background of messages that reply to you when hovered */

      /* status indicator colors */
      --online: ${colors.inverse_primary.hex};
      --dnd: ${colors.error.hex};
      --idle: ${colors.tertiary_container.hex};
      --streaming: ${colors.on_primary.hex};
      --offline: ${colors.outline.hex};

      /* border colors */
      --border-light: var(--hover); /* general light border color */
      --border: var(--active); /* general normal border color */
      --border-hover: var(--active); /* border color of panels when hovered */
      --button-border: hsl(
        220,
        0%,
        100%,
        0.1
      ); /* neutral border color of buttons */

      /* base colors */
      --red-1: oklch(75% 0.12 0);
      --red-2: oklch(70% 0.12 0);
      --red-3: oklch(65% 0.12 0);
      --red-4: oklch(60% 0.12 0);
      --red-5: oklch(55% 0.12 0);

      --green-1: oklch(75% 0.11 170);
      --green-2: oklch(70% 0.11 170);
      --green-3: oklch(65% 0.11 170);
      --green-4: oklch(60% 0.11 170);
      --green-5: oklch(55% 0.11 160);

      --blue-1: oklch(75% 0.1 215);
      --blue-2: oklch(70% 0.1 215);
      --blue-3: oklch(65% 0.1 215);
      --blue-4: oklch(60% 0.1 215);
      --blue-5: oklch(55% 0.1 215);

      --yellow-1: oklch(80% 0.11 90);
      --yellow-2: oklch(75% 0.11 90);
      --yellow-3: oklch(70% 0.11 90);
      --yellow-4: oklch(65% 0.11 90);
      --yellow-5: oklch(60% 0.11 90);

      --purple-1: oklch(75% 0.11 310);
      --purple-2: oklch(70% 0.11 310);
      --purple-3: oklch(65% 0.11 310);
      --purple-4: oklch(60% 0.11 310);
      --purple-5: oklch(55% 0.11 310);
    }
  '';
in {
  config = mkIf (!isServer && cfg.enable) {
    xdg.configFile."vesktop/themes/midnight.css".text = theme;
  };
}
