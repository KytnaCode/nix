{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # Use hyprlock
        before_sleep_cmd = "loginctl lock-session"; # Lock session.
        after_sleep_cmd = "hyprctl dispatch dpms on"; # Turn screen on again.
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 360;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          onn-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
