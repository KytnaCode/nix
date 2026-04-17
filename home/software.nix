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
    microsoft-edge
    brave
    obsidian
    zotero
    github-copilot-cli

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

  # To small to have a separated file.
  programs = {
    discord.enable = true;
    distrobox.enable = true;
    gh.enable = true;
    jq.enable = true;
    jqp.enable = true;
    nix-index.enable = true;
    numbat.enable = true;
  };
}
