{
  lib,
  pkgs,
  isServer,
  colors,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer) {
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.name = "kvantum";
    };

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "kvantum";
      # scaling - 1 means no scaling
      # QT_AUTO_SCREEN_SCALE_FACTOR = "1";

      # use wayland as the default backend, fallback to xcb if wayland is not available
      QT_QPA_PLATFORM = "wayland;xcb";

      # disable window decorations everywhere
      # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      # remain backwards compatible with qt5
      # DISABLE_QT5_COMPAT = "0";

      # tell calibre to use the dark theme
      # CALIBRE_USE_DARK_PALETTE = "1";
    };

    home.packages = with pkgs.libsForQt5; [
      qt5ct
      qtstyleplugin-kvantum
    ];

    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=Meow";
      "Kvantum/Meow/Meow.kvconfig".text = ''
        [%General]
        author=Sam Hansen
        comment=Meow Dark style
        spread_menuitems=true
        left_tabs=true
        mirror_doc_tabs=true
        scroll_width=12
        attach_active_tab=true
        composite=true
        menu_shadow_depth=7
        tooltip_shadow_depth=0
        splitter_width=7
        check_size=16
        slider_width=4
        slider_handle_width=18
        slider_handle_length=18
        textless_progressbar=false
        menubar_mouse_tracking=true
        slim_toolbars=false
        toolbutton_style=1
        x11drag=menubar_and_primary_toolbar
        double_click=false
        translucent_windows=true
        blurring=true
        popup_blurring=true
        opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux3_qt4,avidemux3_qt5,kamoso,QtCreator,VirtualBox,trojita,dragon,digikam,qmplay2
        group_toolbar_buttons=false
        vertical_spin_indicators=false
        fill_rubberband=false
        spread_progressbar=true
        merge_menubar_with_toolbar=true
        small_icon_size=16
        large_icon_size=32
        button_icon_size=16
        scroll_arrows=false
        iconless_pushbutton=true
        toolbar_icon_size=16
        combo_as_lineedit=true
        button_contents_shift=false
        groupbox_top_label=true
        inline_spin_indicators=true
        joined_inactive_tabs=false
        layout_spacing=2
        submenu_overlap=0
        tooltip_delay=-1
        animate_states=false
        transient_scrollbar=true
        alt_mnemonic=true
        combo_menu=true
        layout_margin=4
        no_window_pattern=false
        respect_DE=true
        scroll_min_extent=36
        scrollable_menu=false
        scrollbar_in_view=false
        spin_button_width=16
        submenu_delay=250
        tree_branch_line=true
        progressbar_thickness=8
        click_behavior=0
        contrast=1.00
        dialog_button_layout=0
        drag_from_buttons=false
        hide_combo_checkboxes=false
        intensity=1.00
        no_inactiveness=false
        reduce_menu_opacity=0
        reduce_window_opacity=10
        saturation=1.00
        shadowless_popup=false
        transient_groove=false

        [GeneralColors]
        window.color=${colors.background.hex}
        base.color=${colors.background.hex}
        alt.base.color=${colors.surface_container_low.hex}
        button.color=${colors.primary_container.hex}
        light.color=${colors.surface_container_low.hex}
        mid.light.color=${colors.surface_container_high.hex}
        dark.color=${colors.surface_container_high.hex}
        mid.color=${colors.surface_container_high.hex}
        highlight.color=${colors.primary.hex}
        inactive.highlight.color=${colors.primary.hex}
        text.color=${colors.on_background.hex}
        window.text.color=${colors.on_background.hex}
        button.text.color=${colors.on_primary_container.hex}
        disabled.text.color=#898d99
        tooltip.text.color=${colors.on_background.hex}
        highlight.text.color=${colors.on_primary_container.hex}
        link.color=${colors.secondary.hex}
        link.visited.color=${colors.tertiary.hex}

        [ItemView]
        inherits=PanelButtonCommand
        frame.element=itemview
        interior.element=itemview
        frame=true
        interior=true
        text.iconspacing=3
        text.toggle.color=#ffffff

        [RadioButton]
        inherits=PanelButtonCommand
        frame=false
        interior.element=radio

        [CheckBox]
        inherits=PanelButtonCommand
        frame=false
        interior.element=checkbox

        [TreeExpander]
        indicator.element=tree
        indicator.size=8

        [ToolTip]
        frame.top=4
        frame.right=4
        frame.bottom=4
        frame.left=4
        frame=true

        [PanelButtonCommand]
        inherits=PanelButtonCommand
        interior.element=button
        frame.element=button
        text.normal.color=#d3dae3
        text.focus.color=#d3dae3
        text.press.color=#ffffff
        text.toggle.color=#ffffff

        [PanelButtonTool]
        inherits=PanelButtonCommand

        [DockTitle]
        inherits=PanelButtonCommand
        interior=false
        frame=false
        text.margin.top=5
        text.margin.bottom=5
        text.margin.left=5
        text.margin.right=5
        indicator.size=0

        [Dock]
        interior.element=toolbar
        frame.element=toolbar
        frame=true
        interior=true

        [GroupBox]
        inherits=PanelButtonCommand
        interior.element=tabframe
        interior=true
        frame=false

        [Focus]
        inherits=PanelButtonCommand
        frame=true
        frame.element=focus
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1
        frame.patternsize=20

        [GenericFrame]
        inherits=PanelButtonCommand
        frame.element=common
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1

        [Slider]
        inherits=PanelButtonCommand
        interior=true
        frame.element=slider
        interior.element=slider
        frame.top=3
        frame.bottom=3
        frame.left=3
        frame.right=3
        focusFrame=true

        [SliderCursor]
        inherits=PanelButtonCommand
        interior=true
        interior.element=slidercursor
        frame=false

        [LineEdit]
        inherits=PanelButtonCommand
        frame.element=lineedit
        interior.element=lineedit

        [IndicatorSpinBox]
        inherits=LineEdit
        frame.element=lineedit
        interior.element=lineedit
        frame.top=0
        frame.bottom=2
        frame.left=2
        frame.right=2
        indicator.size=8

        [DropDownButton]
        inherits=PanelButtonCommand
        frame.top=2
        frame.bottom=2
        frame.left=0
        frame.right=1
        indicator.size=8

        [ToolboxTab]
        inherits=PanelButtonCommand
        frame.element=tabframe
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1

        [Tab]
        inherits=PanelButtonCommand
        interior.element=tab
        frame.element=tab
        frame.top=2
        frame.bottom=3
        frame.left=3
        frame.right=3
        indicator.size=10
        text.normal.color=#898d99
        text.focus.color=#ffffff
        text.press.color=#ffffff
        text.toggle.color=#ffffff
        focusFrame=true

        [TabBarFrame]
        inherits=GenericFrame
        frame=true
        frame.element=tabBarFrame
        interior=false
        frame.top=4
        frame.bottom=4
        frame.left=4
        frame.right=4

        [TabFrame]
        inherits=PanelButtonCommand
        frame.element=tabframe
        interior.element=tabframe

        [Dialog]
        inherits=TabBarFrame
        frame.element=tabframe
        interior=false
        frame=false
        frame.top=1
        frame.bottom=1
        frame.left=1
        frame.right=1

        [HeaderSection]
        inherits=PanelButtonCommand
        interior.element=header
        frame.element=header
        frame.top=0
        frame.bottom=1
        frame.left=1
        frame.right=1
        frame.expansion=0
        text.normal.color=#d3dae3
        text.focus.color=#5294e2
        text.press.color=#d3dae3
        text.toggle.color=#d3dae3
        indicator.element=harrow

        [SizeGrip]
        inherits=PanelButtonCommand
        frame=false
        interior=false
        indicator.element=resize-grip
        indicator.size=0

        [Toolbar]
        inherits=PanelButtonCommand
        interior.element=menubar
        frame.element=menubar
        frame=true
        frame.bottom=4
        frame.left=4
        frame.right=4
        text.normal.color=#d3dae3
        text.focus.color=#d3dae3
        text.press.color=#ffffff
        text.toggle.color=#ffffff
        text.bold=false

        [MenuBar]
        inherits=PanelButtonCommand
        frame.element=menubar
        interior.element=menubar
        frame.bottom=0
        text.normal.color=#d3dae3
        frame.expansion=0
        text.bold=false

        [ToolbarButton]
        frame.element=tbutton
        interior.element=tbutton
        indicator.element=arrow
        text.normal.color=#d3dae3
        text.focus.color=#d3dae3
        text.press.color=#ffffff
        text.toggle.color=#ffffff
        text.bold=false

        [Scrollbar]
        inherits=PanelButtonCommand
        indicator.size=0
        interior=false
        frame=false

        [ScrollbarGroove]
        inherits=PanelButtonCommand
        interior=false
        frame=false

        [ScrollbarSlider]
        inherits=PanelButtonCommand
        frame.element=scrollbarslider
        interior=false
        frame.left=6
        frame.right=6
        frame.top=6
        frame.bottom=6

        [ProgressbarContents]
        inherits=PanelButtonCommand
        frame=true
        frame.element=progress-pattern
        interior.element=progress-pattern
        frame.top=2
        frame.bottom=2
        frame.left=2
        frame.right=2

        [Progressbar]
        inherits=PanelButtonCommand
        frame.element=progress
        interior.element=progress
        frame.top=2
        frame.bottom=2
        frame.left=2
        frame.right=2
        text.margin=0
        text.normal.color=#d3dae3
        text.focus.color=#d3dae3
        text.press.color=#ffffff
        text.toggle.color=#ffffff
        text.bold=false
        frame.expansion=18

        [RadioButton]
        inherits=PanelButtonCommand

        [Menu]
        frame.element=menu
        interior.element=menu
        inherits=PanelButtonCommand
        text.press.color=#ffffff
        text.toggle.color=#ffffff
        text.bold=false
        frame.top=3
        frame.bottom=3
        frame.left=3
        frame.right=3

        [MenuItem]
        inherits=PanelButtonCommand
        interior.element=menuitem
        indicator.size=8
        text.focus.color=#ffffff
        text.press.color=#ffffff

        [MenuBarItem]
        inherits=PanelButtonCommand
        interior.element=menubaritem
        frame=false
        text.margin.top=3
        text.margin.bottom=3
        text.margin.left=5
        text.margin.right=5

        [StatusBar]
        inherits=Toolbar
        frame.element=toolbar
        font.bold=true
        text.normal.color=#d3dae3
        frame=true
        frame.top=0
        frame.bottom=0

        [TitleBar]
        inherits=PanelButtonCommand
        frame=false
        interior=false
        text.margin.top=2
        text.margin.bottom=2
        text.margin.left=3
        text.margin.right=3

        [ComboBox]
        inherits=PanelButtonCommand
        indicator.size=8
        frame.top=3
        frame.bottom=3
        frame.left=3
        frame.right=3
        text.margin.top=1
        text.margin.bottom=1
        text.margin.left=3
        text.margin.right=3
        text.toggle.color=#ffffff

        [ToolboxTab]
        inherits=PanelButtonCommand
        text.normal.color=#d3dae3
        text.press.color=#ffffff
        text.focus.color=#d3dae3

        [Hacks]
        transparent_dolphin_view=false
        blur_konsole=true
        transparent_ktitle_label=true
        transparent_menutitle=true
        respect_darkness=true
        kcapacitybar_as_progressbar=true
        force_size_grip=false
        iconless_pushbutton=true
        iconless_menu=false
        disabled_icon_opacity=100
        lxqtmainmenu_iconsize=0
        normal_default_pushbutton=true
        single_top_toolbar=false
        tint_on_mouseover=0
        transparent_pcmanfm_sidepane=true
        transparent_pcmanfm_view=false
        blur_translucent=true
        centered_forms=false
        kinetic_scrolling=false
        middle_click_scroll=false
        no_selection_tint=false
        noninteger_translucency=false
        style_vertical_toolbars=false
        blur_only_active_window=false

        [Window]
        interior=true
        interior.element=window
        frame.top=0
        frame.bottom=0
        frame.left=0
        frame.right=0
      '';
    };
  };
}
