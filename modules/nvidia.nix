{
  config,
  lib,
  myutils,
  ...
}:
with lib; let
  cfg = config.custom.nvidia;
in {
  options.custom.nvidia = {
    enable = mkEnableOption "install nvidia drivers";
    proprietary = myutils.mkDefaultEnableOption "use propietary drivers";
  };

  config = mkIf cfg.enable {
    hardware.nvidia = {
      open = !cfg.proprietary;

      nvidiaSettings = cfg.proprietary;

      modesetting.enable = true;
    };

    services.xserver.videoDrivers = mkIf cfg.proprietary ["nvidia"];
  };
}
