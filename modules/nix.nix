{
  config,
  lib,
  inputs,
  myutils,
  ...
}:
with lib; let
  module = "nix-config";
  cfg = config.${module};
in {
  options.${module} = {
    withFlakes = myutils.mkDefaultEnableOption "enable flakes";

    withDefaultOverlays = myutils.mkDefaultEnableOption "use predefined overlays";

    withUnfreePackages = myutils.mkDefaultEnableOption "allow unfree packages";
  };

  config = {
    nix.settings.experimental-features = mkIf cfg.withFlakes ["nix-command" "flakes"];

    nixpkgs.overlays =
      mkIf cfg.withDefaultOverlays
      ([
          inputs.nixneovimplugins.overlays.default
        ]
        ++ import ../overlays {inherit lib;});

    nixpkgs.config.allowUnfree = cfg.withUnfreePackages;
  };
}
