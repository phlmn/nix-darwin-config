{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    historyLimit = 20000;

    extraConfig = ''
      # Keep directory when creating new windows or panes
      bind c      new-window          -c "#{pane_current_path}"
      bind %      split-window    -h  -c "#{pane_current_path}"
      bind '"'    split-window    -v  -c "#{pane_current_path}"

      # move windows with ctrl-shift left or right
      #bind-key -n C-S-Left swap-window -t -1
      #bind-key -n C-S-Right swap-window -t +1
      bind -n S-down new-window
      bind -n S-left prev
      bind -n S-right next
      bind -n M-left swap-window -t -1\; select-window -t -1
      bind -n M-right swap-window -t +1\; select-window -t +1

      # order sessions by name
      bind s choose-tree -sZ -O name

      # enable mouse support
      set -g mouse on

      # fix wrong shell due to bug in tmux sensible (https://github.com/tmux/tmux/issues/4162#issuecomment-2412201969)
      set -g default-command "$SHELL"

      set -g status-interval 5
      set -g automatic-rename on
      set -g automatic-rename-format '#{b:pane_current_path}'
    '';

    plugins =
      with pkgs; [
        tmuxPlugins.copycat
        tmuxPlugins.yank
        tmuxPlugins.open
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-capture-pane-contents on";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = "set -g @continuum-restore on";
        }
        {
          plugin = tmuxPlugins.better-mouse-mode;
          extraConfig = ''
            set -g @scroll-speed-num-lines-per-scroll "1"
            set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"
          '';
        }
      ];
  };
}
