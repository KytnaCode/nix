{
  programs = {
    zsh.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
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
}
