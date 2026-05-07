{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.custom.hardware.graphicTablet;
in {
  options.custom.hardware.graphicTablet.enable = mkEnableOption "enable graphic tablet support";

  config = mkIf cfg.enable {
    hardware.opentabletdriver.enable = true;

    services.xserver.digimend.enable = true;
  };
}
