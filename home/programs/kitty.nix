{
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;
    enableGitIntegration = true;
    themeFile = "Catppuccin-Latte";
    font.name = "AnonymicePro";

    settings = {
      # General
      scrollback_lines = 3500; # Increase scrollback lines.
      paste_actions = "quote-urls-at-prompt,confirm,confirm-if-large";
      strip_trailing_spaces = "smart";
      enable_audio_bell = false;
      notify_on_cmd_finish = "unfocused";

      # Tabbar
      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      # Cursor
      cursor_shape = "beam"; # Beam default cursor.

      # Mouse
      mouse_hide_wait = -1; # Hide on type.
      show_hyprlink_targets = true;

      # Appearance
      background_opacity = 0.8;
      background_blur = 1;
    };
  };
}
