{pkgs, ...}: {
  programs.tmux = let
    tmux2k = pkgs.tmuxPlugins.mkTmuxPlugin {
      pluginName = "2k";
      version = "unstable-2025-07-14";
      src = pkgs.fetchFromGitHub {
        owner = "2KAbhishek";
        repo = "tmux2k";
        rev = "a7834f40cf5ce42d90a2b41be053e96c16733916";
        sha256 = "sha256-pT3QAxnTCCHonLb+39YLozPROXLYkK+QhxZ88iFXkuM=";
      };
    };
  in {
    enable = true;

    tmuxinator.enable = true; # For complex sessions.

    baseIndex = 1;
    disableConfirmationPrompt = true; # Kill pane without confirmation.
    keyMode = "vi"; # Vi > Emacs. Change my mind.
    mouse = true; # I rarely use it, but is a bit handy.
    prefix = "C-a"; # I hate defaults C-b.
    sensibleOnTop = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-kitty";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = tmux2k;
        extraConfig = ''
          set -g @tmux2k-theme 'catppuccin'
          set -g @tmux2k-left-plugins "session cwd git"
          set -g @tmux2k-right-plugins "bandwidth cpu ram time"
          set -g @tmux2k-left-sep 
          set -g @tmux2k-right-sep 

          set -g @tmux2k-purple "#8839ef" # catppuccin latte - mauve
          set -g @tmux2k-pink "#ea76cb" # catppuccin latte - pink
          set -g @tmux2k-gray "#ccd0da" # catppuccin latte - surface0
          set -g @tmux2k-white "#e6e9ef" # catppuccin latte - mantle

          set -g @tmux2k-session-colors "purple white"
          set -g @tmux2k-cwd-colors "pink text"
          set -g @tmux2k-git-colors "gray text"
          set -g @tmux2k-bandwidth-colors "gray text"
          set -g @tmux2k-cpu-colors "pink text"
          set -g @tmux2k-ram-colors "pink text"
          set -g @tmux2k-time-colors "purple white"
          set -g @tmux2k-window-list-colors "white pink"

          set -g @tmux2k-text "#4c4f69" # catppuccin latte - text
          set -g @tmux2k-bg-main "#e6e9ef" # catppuccin latte - mantle
          set -g @tmux2k-bg-alt "#ccd0da" # catppuccin latte - surface0
          set -g @tmux2k-message-bg "#ea76cb" # catppuccin latte - pink
          set -g @tmux2k-message-fg "#4c4f69" # catppuccin latte - text
          set -g @tmux2k-pane-active-border "#ea76cb" # catppuccin latte - pink
          set -g @tmux2k-pane-border "#ccd0da" # catppuccin latte - surface0
          set -g @tmux2k-prefix-highlight "#ea76cb" # catppuccin latte - pink

          set -g @tmux2k-window-list-format "#[fg=#4c4f69]#I:#W"
        '';
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-processes '"~nvim->nvim" quickshell journalctl'
        '';
      }
      pain-control # Better pane keymaps.
      better-mouse-mode # Again, I rarely use mouse, but it's handy sometimes.
      tmux-thumbs
      tmux-which-key
      tmux-fzf # Manage tmux with fzf.
      online-status
      net-speed
      mode-indicator
      cpu
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
      }
    ];
  };
}
