{
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$term" = "kitty";
      "$browser" = "firefox";

      monitor = [
        "HDMI-A-1, 1920x1080@60, 0x-1080, 1"
        "DVI-D-1, 1920x1080@60, 0x0, 1"
      ];

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
        kb_layout = "us,latam";
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

      bind = [
        "$mod, return, exec, $term"
        "$mod, b, exec, $browser"

        "$mod SHIFT, q, killactive"
        "$mod ALT SHIFT, q, forcekillactive"
        "$mod, v, togglefloating"
        "$mod, f, fullscreen, 0"
        "$mod, z, fullscreen, 1"
        "$mod, p, pin"
        "$mod SHIFT, esc, exec, uwsm stop"
        "$mod, o, exec, hyprpicker -arq -f hex"
        "$mod SHIFT, s, exec, hyprshot --mode region --freeze --silent --clipboard-only"
        "$mod SHIFT ALT, s, exec, hyprshot --mode output --freeze --silent --clipboard-only"
        "$mod, space, exec, hyprctl switchxkblayout current next"

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

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
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
        "nodim,title:(.*)- YouTube —(.*)"
        "noblur,title:(.*)- YouTube —(.*)"
        "opacity 1.0 override 1.0 override 1.0 override,title:(.*)- YouTube —(.*)"
      ];
    };
  };
}
