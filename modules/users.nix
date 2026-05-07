{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.custom.users = {
    main = {
      enable = mkEnableOption "enable main user";
      name = mkOption {
        type = types.str;
        example = "alex";
      };
    };
  };

  config = let
    cfg = config.custom.users;
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
