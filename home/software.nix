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
    inkscape
    lunacy
    manuskript

    # Productivity
    anki
    firefox
    microsoft-edge
    obsidian
    zotero

    # Utility
    flatpak
    gnome-clocks
    jq
    qalculate-gtk

    # Hyprland related
    hyprpicker
    hyprshot

    # Fonts
    merriweather
    montserrat
    mplus-outline-fonts.githubRelease
    nerd-fonts.anonymice
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    raleway

    # System
    pwvucontrol
    wl-clipboard
  ];
}
