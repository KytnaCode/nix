{
  imports = [
    ./hypridle.nix
    ./hyprpaper
  ];

  # Too small to have a dedicated file:
  services.hyprpolkitagent.enable = true;
  services.blanket.enable = true;
}
