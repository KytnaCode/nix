{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

    systemd.enable = true;
    xwayland.enable = true;

    plugins = [
      inputs.hy3.packages.${system}.hy3
      inputs.split-monitor-workspaces.packages.${system}.split-monitor-workspaces
    ];

    settings = {
      "$mod" = "SUPER";
      "$term" = "kitty";
      "$browser" = "microsoft-edge";
      "$launcher" = "wofi";

      monitor = [
        "HDMI-A-1, 1920x1080@60, 0x-1080, 1"
        "DVI-D-1, 1920x1080@60, 0x0, 1"
      ];

      plugin = {
        split-monitor-workspaces.count = 7;
      };

      general = {
        border_size = 2;
        gaps_in = 5;
        gaps_out = 15;
        "col.inactive_border" = "$surface0";
        "col.active_border" = "$accent rgba($accentAlphae2) 45deg";

        snap = {
          enabled = true;
        };
      };

      decoration = {
        rounding = 16;
        rounding_power = 3;
        active_opacity = 1;
        inactive_opacity = 0.8;
        dim_inactive = true;
        dim_strength = 0.35;

        blur = {
          enabled = true;
        };

        shadow = {
          enabled = true;
          color = "rgba($accentAlpha1a)";
          color_inactive = "rgba($baseAlpha1a)";
        };
      };

      input = {
        kb_layout = "us";
        accel_profile = "flat";
      };

      misc = {
        font_family = "AnonymicePro";
        force_default_wallpaper = 1;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      cursor = {
        default_monitor = "DVI-D-2";
        hide_on_key_press = true;
      };

      exec-once = "fcitx5";

      bind = [
        "$mod, return, exec, $term"
        "$mod, b, exec, $browser"
        "$mod, d, exec, $launcher"

        "$mod SHIFT, q, killactive"
        "$mod ALT SHIFT, q, forcekillactive"
        "$mod, v, togglefloating"
        "$mod, f, fullscreen, 0"
        "$mod, z, fullscreen, 1"
        "$mod, p, pin"
        "$mod SHIFT, Escape, exec, uwsm stop"
        "$mod, o, exec, hyprpicker -arq -f hex"
        "$mod SHIFT, s, exec, hyprshot --mode region --freeze --silent --clipboard-only"
        "$mod SHIFT ALT, s, exec, hyprshot --mode output --freeze --silent --clipboard-only"

        "$mod, KP_Up, exec, hyprsunset temperature +100"
        "$mod, KP_Down, exec, hyprsunsent temperature -100"
        "$mod, KP_Left, exec, hyprsunsent gamma -10"
        "$mod, KP_Right, exec, hyprsunsent gamma +10"
        "$mod, KP_Begin, exec, hyprsunsent identity"

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod SHIFT, h, movewindoworgroup, l"
        "$mod SHIFT, j, movewindoworgroup, d"
        "$mod SHIFT, k, movewindoworgroup, u"
        "$mod SHIFT, l, movewindoworgroup, r"

        "$mod, 1, split-workspace, 1"
        "$mod, 2, split-workspace, 2"
        "$mod, 3, split-workspace, 3"
        "$mod, 4, split-workspace, 4"
        "$mod, 5, split-workspace, 5"
        "$mod, 6, split-workspace, 6"
        "$mod, 7, split-workspace, 7"

        "$mod SHIFT, 1, split-movetoworkspace, 1"
        "$mod SHIFT, 2, split-movetoworkspace, 2"
        "$mod SHIFT, 3, split-movetoworkspace, 3"
        "$mod SHIFT, 4, split-movetoworkspace, 4"
        "$mod SHIFT, 5, split-movetoworkspace, 5"
        "$mod SHIFT, 6, split-movetoworkspace, 6"
        "$mod SHIFT, 7, split-movetoworkspace, 7"
      ];

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "opacity 1.0 override, title:(.*)(YouTube)(.*)"
        "nodim, noblur, title:(.*)(YouTube)(.*)"
        "float, title:Bitwarden"
        "float, class:qalculate-gtk"
      ];
    };
  };
}
