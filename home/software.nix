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

    # Creativity
    inkscape
    lunacy
    manuskript

    # Productivity
    firefox
    microsoft-edge
    (pkgs.writeShellScriptBin "microsoft-edge-stable" "${pkgs.microsoft-edge}/bin/microsoft-edge \"$@\"")
    obsidian
    zotero

    # Utility
    flatpak
    gnome-clocks
    qalculate-gtk
    unzip
    glow

    # Games
    prismlauncher

    # Hyprland related
    hyprpicker

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
