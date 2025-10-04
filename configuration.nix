# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Config modules:
    ./modules/input.nix
    ./modules/networking.nix
    ./modules/software.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  catppuccin.flavor = "latte";

  nixpkgs.overlays =
    [
      inputs.nixneovimplugins.overlays.default
    ]
    ++ import ./overlays;

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Mazatlan";

  # Hardware config.
  hardware = {
    graphics.enable = true;

    # Use propetiary drivers.
    nvidia.open = false;

    bluetooth.enable = true;
  };

  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    hunspell
    hunspellDicts.es_MX
    hunspellDicts.en_US
  ];

  services = {
    # Connfigure Audio.
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # NVidia Propetiary drivers.
    xserver.videoDrivers = ["nvidia"];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
