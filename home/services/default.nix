{
  imports = [
    ./hypridle.nix
    ./hyprpaper
    ./swaync.nix
  ];

  # Too small to have a dedicated file:
  services.hyprpolkitagent.enable = true;
  services.blanket.enable = true;
}
