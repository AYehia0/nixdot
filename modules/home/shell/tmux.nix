{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "kitty";
    mouse = true;
    prefix = "C-Space";
    baseIndex = 1;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      tmux-fzf
      yank
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux "on"
          set -g @tokyo-night-tmux_theme night
          set -g @tokyo-night-tmux_transparent 1
        '';
      }
    ];

    extraConfig = ''
      set -g status on

      bind-key -r f run-shell "tmux neww ~/bin/tmux-sessionizer"
      bind p attach-session -c '#{pane_current_path}'
      bind -r ^ last-window

      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      set-option -g history-limit 5000

      bind v split-window -h
      bind h split-window -v
      unbind '"'
      unbind %

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'wl-copy || true'

      bind '"' split-window -v -c '#{pane_current_path}'
      bind % split-window -h -c '#{pane_current_path}'

      bind-key b set-option status
    '';
  };
}
