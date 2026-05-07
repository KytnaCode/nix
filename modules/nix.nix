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
    withFlakes = myutils.mkDefaultEnableOption;

    withDefaultOverlays = myutils.mkDefaultEnableOption;

    withUnfreePackages = myutils.mkDefaultEnableOption;
  };

  config = {
    nix.settings.experimental-features = mkIf cfg.withFlakes ["nix-command" "flakes"];

    nixpkgs.overlays =
      mkIf cfg.withDefaultOverlays
      ([
          inputs.nixneovimplugins.overlays.default
        ]
        ++ import ./overlays {inherit lib;});

    nixpkgs.config.allowUnfree = cfg.withUnfreePackages;
  };
}
