{
  inputs,
  system,
  pkgs,
  ...
}: {
  programs = {
    zsh.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${system}.hyprland;
      portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
    };

    localsend = {
      enable = true;
      openFirewall = true;
    };
  };

  services = {
    desktopManager.plasma6.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    flatpak.enable = true;
  };

  environment.systemPackages = with pkgs; [
    qt6.qtbase
  ];
}
