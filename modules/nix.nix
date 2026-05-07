{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  module = "nix-config";
  cfg = config.${module};

  mkDefaultEnabledOption = mkOption {
    type = types.bool;
    default = true;
  };
in {
  options.${module} = {
    withFlakes = mkDefaultEnabledOption;

    withDefaultOverlays = mkDefaultEnabledOption;

    withUnfreePackages = mkDefaultEnabledOption;
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
