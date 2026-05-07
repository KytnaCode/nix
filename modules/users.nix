{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.users.predefinided = {
    main = {
      enable = mkEnableOption "enable main user";
      name = mkOption {
        type = types.string;
        example = "alex";
      };
    };
  };

  config = let
    cfg = config.users.predefinided;
  in {
    users.users.${cfg.main.name} = mkIf cfg.main.enable {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.zsh;
    };
  };
}
