{
  inputs,
  system,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./services
  ];

  home.packages = with pkgs; [
    inputs.quickshell.packages.${system}.default

    # Social
    discord

    # Creativity
    manuskript

    # Productivity
    firefox
    microsoft-edge
    lunacy
    obsidian
    anki

    # Utility
    gnome-clocks
    flatpak
    jq
    qalculate-gtk

    # Hyprland related
    hyprpicker
    hyprshot

    # Fonts
    merriweather
    montserrat
    raleway
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.anonymice
    nerd-fonts.symbols-only

    # System
    pwvucontrol
    wl-clipboard
  ];
}
