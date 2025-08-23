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
    manuskript

    # Productivity
    firefox
    obsidian

    # Hyprland related
    hyprpicker
    hyprshot

    # Fonts
    merriweather
    montserrat
    nerd-fonts.anonymice
    nerd-fonts.symbols-only

    # System
    pwvucontrol
    wl-clipboard
  ];
}
