{...}: let
  colors = import ../../../../.local/state/matugen/colors.nix;
in {
  programs.tmux = {
    enable = false;
    terminal = "screen-256color";
    shell = "/run/current-system/sw/bin/fish";
    clock24 = false;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    historyLimit = 2000;
    keyMode = "vi";
    prefix = "M-g";
    extraConfig = ''
      set-option -g status-position top
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      unbind C-b
      bind -N "Send the prefix key through to the application" M-t send-prefix

      set -gq allow-passthrough on
      set -g visual-activity off
      setw -g aggressive-resize off
      setw -g clock-mode-style 12

      # setw -g pane-background-index 1

      set-option -sa terminal-overrides ",xterm*:Tc"

      bind c copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key b set-option status
      bind v split-window -v -c "#{pane_current_path}"
      bind h split-window -h -c "#{pane_current_path}"

      set-option -g @primary "${colors.primary}"
      set-option -g @on_primary "${colors.on_primary}"
      set-option -g @primary_container "${colors.primary_container}"
      set-option -g @on_primary_container "${colors.on_primary_container}"
      set-option -g @tertiary_container "${colors.tertiary_container}"
      set-option -g @on_tertiary_container "${colors.on_tertiary_container}"
      set-option -g @on_surface "${colors.on_surface}"
      set-option -g @inverse_on_surface "${colors.inverse_on_surface}"
      set-option -g @secondary "#454559"
      set-option -g @secondary_on_tertiary "#e2e0f9"
      set-option -g @background "${colors.background}"
      # set-option -g @tertiary_container_on_tertiary "#ffd8eb"
      set-option -g @window_color "#39383f"
      set-option -g @indicator_color "#e9b9d2"
      set-option -g @on_tertiary_fixed "${colors.on_tertiary_fixed}"

      set-option -g pane-active-border fg=black
      set-option -g pane-border-style fg=black
      set-option -g status-style "bg=default fg=default"

      set-option -g status-left-style none
      set -g status-left-length 60
      set-option -g status-left "#[bg=#{@primary_container},fg=#{@on_primary_container}]#{?client_prefix, , } #[default] #[fg=#{@on_tertiary_container},bg=#{@tertiary_container}] #S #[default] "

      set-option -g status-right-style none
      set -g status-right-length 120
      set -g status-right '#[fg=white]#(if git -C "#{pane_current_path}" rev-parse --is-inside-work-tree 2>/dev/null; then echo "  on #[fg=#{@on_surface}]$(git -C "#{pane_current_path}" rev-parse --abbrev-ref HEAD)"; fi) #[fg=#{@primary}] #[fg=#{@on_primary_container},bg=#{@primary_container}]  #[fg=#{@on_tertiary_container},bg=#{@tertiary_container}] #W #[default] #[fg=#{@on_primary_container},bg=#{@primary_container}]  #[fg=#{@on_surface},bg=default] #{p:pane_current_path} #[fg=#{@on_tertiary_container},bg=#{@tertiary_container}] %H #[fg=#{@on_primary_container},bg=#{@primary_container}] %M '

      set -g window-status-separator "#[bg=default] "
      set -g window-status-current-format "#[fg=color15,bg=color8] #W #[fg=color0,bg=color2] #I "
      set -g window-status-format "#[fg=color15,bg=color8] #W #[fg=color0,bg=color3] #I "
    '';
  };
}
