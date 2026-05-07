{
  config,
  lib,
  inputs,
  system,
  ...
}:
with lib; let
  cfg = config.custom.desktop;
in {
  options.custom.desktop = {
    environment = {
      hyprland.enable = mkEnableOption "enable hyprland";
      plasma6.enable = mkEnableOption "enable plasma6";
    };

    display = {
      sddm.enable = mkEnableOption "enable sddm";
    };
  };

  config = {
    programs = {
      hyprland = mkIf cfg.environment.hyprland.enable {
        enable = true;
        withUWSM = true;
        package = inputs.hyprland.packages.${system}.hyprland;
        portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
      };
    };

    services = {
      desktopManager.plasma6.enable = cfg.environment.plasma6.enable;

      displayManager.sddm = mkIf cfg.display.sddm.enable {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
