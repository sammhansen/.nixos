{pkgs, ...}: let
  config = ''
        keybinds clear-defaults=true {
        locked {
            bind "Ctrl g" { SwitchToMode "normal"; }
        }
        pane {
            bind "left" { MoveFocus "left"; }
            bind "down" { MoveFocus "down"; }
            bind "up" { MoveFocus "up"; }
            bind "right" { MoveFocus "right"; }
            bind "c" { SwitchToMode "renamepane"; PaneNameInput 0; }
            bind "d" { NewPane "down"; SwitchToMode "locked"; }
            bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "locked"; }
            bind "f" { ToggleFocusFullscreen; SwitchToMode "locked"; }
            bind "h" { MoveFocus "left"; }
            bind "i" { TogglePanePinned; SwitchToMode "locked"; }
            bind "j" { MoveFocus "down"; }
            bind "k" { MoveFocus "up"; }
            bind "l" { MoveFocus "right"; }
            bind "n" { NewPane; SwitchToMode "locked"; }
            bind "p" { SwitchToMode "normal"; }
            bind "r" { NewPane "right"; SwitchToMode "locked"; }
            bind "w" { ToggleFloatingPanes; SwitchToMode "locked"; }
            bind "x" { CloseFocus; SwitchToMode "locked"; }
            bind "z" { TogglePaneFrames; SwitchToMode "locked"; }
            bind "tab" { SwitchFocus; }
        }
        tab {
            bind "left" { GoToPreviousTab; }
            bind "down" { GoToNextTab; }
            bind "up" { GoToPreviousTab; }
            bind "right" { GoToNextTab; }
            bind "1" { GoToTab 1; SwitchToMode "locked"; }
            bind "2" { GoToTab 2; SwitchToMode "locked"; }
            bind "3" { GoToTab 3; SwitchToMode "locked"; }
            bind "4" { GoToTab 4; SwitchToMode "locked"; }
            bind "5" { GoToTab 5; SwitchToMode "locked"; }
            bind "6" { GoToTab 6; SwitchToMode "locked"; }
            bind "7" { GoToTab 7; SwitchToMode "locked"; }
            bind "8" { GoToTab 8; SwitchToMode "locked"; }
            bind "9" { GoToTab 9; SwitchToMode "locked"; }
            bind "[" { BreakPaneLeft; SwitchToMode "locked"; }
            bind "]" { BreakPaneRight; SwitchToMode "locked"; }
            bind "b" { BreakPane; SwitchToMode "locked"; }
            bind "h" { GoToPreviousTab; }
            bind "j" { GoToNextTab; }
            bind "k" { GoToPreviousTab; }
            bind "l" { GoToNextTab; }
            bind "n" { NewTab; SwitchToMode "locked"; }
            bind "r" { SwitchToMode "renametab"; TabNameInput 0; }
            bind "s" { ToggleActiveSyncTab; SwitchToMode "locked"; }
            bind "t" { SwitchToMode "normal"; }
            bind "x" { CloseTab; SwitchToMode "locked"; }
            bind "tab" { ToggleTab; }
        }
        resize {
            bind "left" { Resize "Increase left"; }
            bind "down" { Resize "Increase down"; }
            bind "up" { Resize "Increase up"; }
            bind "right" { Resize "Increase right"; }
            bind "+" { Resize "Increase"; }
            bind "-" { Resize "Decrease"; }
            bind "=" { Resize "Increase"; }
            bind "H" { Resize "Decrease left"; }
            bind "J" { Resize "Decrease down"; }
            bind "K" { Resize "Decrease up"; }
            bind "L" { Resize "Decrease right"; }
            bind "h" { Resize "Increase left"; }
            bind "j" { Resize "Increase down"; }
            bind "k" { Resize "Increase up"; }
            bind "l" { Resize "Increase right"; }
            bind "r" { SwitchToMode "normal"; }
        }
        move {
            bind "left" { MovePane "left"; }
            bind "down" { MovePane "down"; }
            bind "up" { MovePane "up"; }
            bind "right" { MovePane "right"; }
            bind "h" { MovePane "left"; }
            bind "j" { MovePane "down"; }
            bind "k" { MovePane "up"; }
            bind "l" { MovePane "right"; }
            bind "m" { SwitchToMode "normal"; }
            bind "n" { MovePane; }
            bind "p" { MovePaneBackwards; }
            bind "tab" { MovePane; }
        }
        scroll {
            bind "Alt left" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
            bind "Alt down" { MoveFocus "down"; SwitchToMode "locked"; }
            bind "Alt up" { MoveFocus "up"; SwitchToMode "locked"; }
            bind "Alt right" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
            bind "e" { EditScrollback; SwitchToMode "locked"; }
            bind "f" { SwitchToMode "entersearch"; SearchInput 0; }
            bind "Alt h" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
            bind "Alt j" { MoveFocus "down"; SwitchToMode "locked"; }
            bind "Alt k" { MoveFocus "up"; SwitchToMode "locked"; }
            bind "Alt l" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
            bind "s" { SwitchToMode "normal"; }
        }
        search {
            bind "c" { SearchToggleOption "CaseSensitivity"; }
            bind "n" { Search "down"; }
            bind "o" { SearchToggleOption "WholeWord"; }
            bind "p" { Search "up"; }
            bind "w" { SearchToggleOption "Wrap"; }
        }
        session {
            bind "a" {
                LaunchOrFocusPlugin "zellij:about" {
                    floating true
                    move_to_focused_tab true
                }
                SwitchToMode "locked"
            }
            bind "c" {
                LaunchOrFocusPlugin "configuration" {
                    floating true
                    move_to_focused_tab true
                }
                SwitchToMode "locked"
            }
            bind "d" { Detach; }
            bind "o" { SwitchToMode "normal"; }
            bind "p" {
                LaunchOrFocusPlugin "plugin-manager" {
                    floating true
                    move_to_focused_tab true
                }
                SwitchToMode "locked"
            }
            bind "w" {
                LaunchOrFocusPlugin "session-manager" {
                    floating true
                    move_to_focused_tab true
                }
                SwitchToMode "locked"
            }
        }
        shared_among "normal" "locked" {
            bind "Alt left" { MoveFocusOrTab "left"; }
            bind "Alt down" { MoveFocus "down"; }
            bind "Alt up" { MoveFocus "up"; }
            bind "Alt right" { MoveFocusOrTab "right"; }
            bind "Alt +" { Resize "Increase"; }
            bind "Alt -" { Resize "Decrease"; }
            bind "Alt =" { Resize "Increase"; }
            bind "Alt [" { PreviousSwapLayout; }
            bind "Alt ]" { NextSwapLayout; }
            bind "Alt f" { ToggleFloatingPanes; }
            bind "Alt h" { MoveFocusOrTab "left"; }
            bind "Alt i" { MoveTab "left"; }
            bind "Alt j" { MoveFocus "down"; }
            bind "Alt k" { MoveFocus "up"; }
            bind "Alt l" { MoveFocusOrTab "right"; }
            bind "Alt n" { NewPane; }
            bind "Alt o" { MoveTab "right"; }
        }
        shared_except "locked" "renametab" "renamepane" {
            bind "Ctrl g" { SwitchToMode "locked"; }
            bind "Ctrl q" { Quit; }
        }
        shared_except "locked" "entersearch" {
            bind "enter" { SwitchToMode "locked"; }
        }
        shared_except "locked" "entersearch" "renametab" "renamepane" {
            bind "esc" { SwitchToMode "locked"; }
        }
        shared_except "locked" "entersearch" "renametab" "renamepane" "move" {
            bind "m" { SwitchToMode "move"; }
        }
        shared_except "locked" "entersearch" "search" "renametab" "renamepane" "session" {
            bind "o" { SwitchToMode "session"; }
        }
        shared_except "locked" "tab" "entersearch" "renametab" "renamepane" {
            bind "t" { SwitchToMode "tab"; }
        }
        shared_except "locked" "tab" "scroll" "entersearch" "renametab" "renamepane" {
            bind "s" { SwitchToMode "scroll"; }
        }
        shared_among "normal" "resize" "tab" "scroll" "prompt" "tmux" {
            bind "p" { SwitchToMode "pane"; }
        }
        shared_except "locked" "resize" "pane" "tab" "entersearch" "renametab" "renamepane" {
            bind "r" { SwitchToMode "resize"; }
        }
        shared_among "scroll" "search" {
            bind "PageDown" { PageScrollDown; }
            bind "PageUp" { PageScrollUp; }
            bind "left" { PageScrollUp; }
            bind "down" { ScrollDown; }
            bind "up" { ScrollUp; }
            bind "right" { PageScrollDown; }
            bind "Ctrl b" { PageScrollUp; }
            bind "Ctrl c" { ScrollToBottom; SwitchToMode "locked"; }
            bind "d" { HalfPageScrollDown; }
            bind "Ctrl f" { PageScrollDown; }
            bind "h" { PageScrollUp; }
            bind "j" { ScrollDown; }
            bind "k" { ScrollUp; }
            bind "l" { PageScrollDown; }
            bind "u" { HalfPageScrollUp; }
        }
        entersearch {
            bind "Ctrl c" { SwitchToMode "scroll"; }
            bind "esc" { SwitchToMode "scroll"; }
            bind "enter" { SwitchToMode "search"; }
        }
        renametab {
            bind "esc" { UndoRenameTab; SwitchToMode "tab"; }
        }
        shared_among "renametab" "renamepane" {
            bind "Ctrl c" { SwitchToMode "locked"; }
        }
        renamepane {
            bind "esc" { UndoRenamePane; SwitchToMode "pane"; }
        }
    }

      // Plugin aliases - can be used to change the implementation of Zellij
      // changing these requires a restart to take effect
      plugins {
          about location="zellij:about"
          compact-bar location="zellij:compact-bar"
          configuration location="zellij:configuration"
          filepicker location="zellij:strider" {
              cwd "/"
          }
          plugin-manager location="zellij:plugin-manager"
          session-manager location="zellij:session-manager"
          status-bar location="zellij:status-bar"
          strider location="zellij:strider"
          tab-bar location="zellij:tab-bar"
          welcome-screen location="zellij:session-manager" {
              welcome_screen true
          }
      }

      load_plugins {
      }

      simplified_ui true

      // themes {
      //   matugen {
      //      styling {
      //           text_unselected {
      //               base #DCD7BA
      //               emphasis_1 #ACD7CD
      //               emphasis_2 #DCD8DD
      //               emphasis_3 #DCD899
      //               emphasis_4 #ACD7CD
      //               background #16161D
      //           }
      //           text_selected {
      //               base #16161D
      //               emphasis_1 #ffa066
      //               emphasis_2 #16161D
      //               emphasis_3 #16161D
      //               emphasis_4 #16161D
      //               background #9CABCA
      //           }
      //           ribbon_unselected     {
      //               base #DCD7BA
      //               emphasis_1 #9CABCA
      //               emphasis_2 #7AA89F
      //               emphasis_3 #ACD7CD
      //               emphasis_4 #DCD819
      //               background #363646
      //           }
      //           ribbon_selected {
      //               base #16161D
      //               emphasis_1 147 0 10
      //               emphasis_2 #ffa066
      //               emphasis_3 #2A2A37
      //               emphasis_4 #363646
      //               background #76946A
      //           }
      //           table_title {
      //               base #DCD7BA
      //               emphasis_1 #7FB4CA
      //               emphasis_2 #A3D4D5
      //               emphasis_3 #7AA89F
      //               emphasis_4 #DCD819
      //               background #252535
      //           }
      //           table_cell_unselected {
      //               base #DCD7BA
      //               emphasis_1 #DCD7CD
      //               emphasis_2 #DCD8DD
      //               emphasis_3 #DCD899
      //               emphasis_4 #ACD7CD
      //               background #1F1F28
      //           }
      //           table_cell_selected {
      //               base #16161D
      //               emphasis_1 #181820
      //               emphasis_2 #1A1A22
      //               emphasis_3 #2A2A37
      //               emphasis_4 #363646
      //               background #DCD7BA
      //           }
      //           list_unselected {
      //               base #23CF6D
      //               emphasis_1 #eb34ab
      //               emphasis_2 #eb99ab
      //               emphasis_3 #ebbbab
      //               emphasis_4 #ebddcb
      //               background #1F1F99
      //           }
      //           list_selected {
      //               base #ebae34
      //               emphasis_1 #ebcc66
      //               emphasis_2 #fcdd77
      //               emphasis_3 #fddd99
      //               emphasis_4 #ffffff
      //               background #353830
      //           }
      //           frame_unselected {
      //               base #DCD8DD
      //               emphasis_1 #7FB4CA
      //               emphasis_2 #A3D4D5
      //               emphasis_3 #7AA89F
      //               emphasis_4 #DCD819
      //           }
      //           frame_selected {
      //               base #76946A
      //               emphasis_1 255 180 171
      //               emphasis_2 #C8C093
      //               emphasis_3 #ACD7CD
      //               emphasis_4 #DCD819
      //           }
      //           frame_highlight {
      //               base #DCD819
      //               emphasis_1 #DCD819
      //               emphasis_2 #DCD819
      //               emphasis_3 #DCD819
      //               emphasis_4 #DCD819
      //           }
      //           exit_code_success {
      //               base #76946A
      //               emphasis_1 #A3D5D5
      //               emphasis_2 #76946A
      //               emphasis_3 #76946A
      //               emphasis_4 #76946A
      //           }
      //           exit_code_error {
      //               base 255 180 171
      //               emphasis_1 #DCD819
      //               emphasis_2 255 180 171
      //               emphasis_3 255 180 171
      //               emphasis_4  255 180 171
      //           }
      //           multiplayer_user_colors {
      //               player_1 255 180 171
      //               player_2 255 180 171
      //               player_3 255 180 171
      //               player_4 255 180 171
      //               player_5 255 180 171
      //               player_6 255 180 171
      //               player_7 255 180 171
      //               player_8 255 180 171
      //               player_9 255 180 171
      //               player_10 255 180 171
      //           }
      //     }
      //   }
      // }

        theme "ansi"

        default_mode "locked"

        default_shell "${pkgs.zsh}/bin/zsh"
        // default_cwd "/tmp"
        default_layout "default"
        // layout_dir "/tmp"
        // theme_dir "/tmp"
        mouse_mode true
        pane_frames false
        mirror_session true
        on_force_close "detach" //quit
        scroll_buffer_size 10000
        copy_command "wl-copy"
        copy_on_select true
        scrollback_editor "${pkgs.neovim}/bin/nvim"

        session_name "spawnPoint"
        attach_to_session true

        // auto_layout false

        // session_serialization false
        // serialize_pane_viewport false
        // scrollback_lines_to_serialize 10000
        // serialization_interval 10000
        // disable_session_metadata false
        // support_kitty_keyboard_protocol false
        // stacked_resize false
        show_startup_tips false
        show_release_notes true
  '';
in {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = config;
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
        pane size=1 borderless=true {
            plugin location="compact-bar"
        }
        pane borderless=true
    }
  '';
}
