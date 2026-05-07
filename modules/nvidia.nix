{
  config,
  lib,
  myutils,
  ...
}:
with lib; let
  module = "custom.nvidia";
  cfg = config.${module};
in {
  options = {
    ${module} = {
      enable = mkEnableOption "install nvidia drivers";
      proprietary = myutils.mkDefaultEnableOption "use propietary drivers";
    };
  };

  config = mkIf cfg.enable {
    hardware.nvidia = {
      open = !cfg.propietary;

      nvidia-settings = cfg.propietary;

      modesetting.enable = true;
    };

    # Nvidia Proprietary drivers.
    xserver.videoDrivers = mkIf cfg.propietary ["nvidia"];
  };
}
