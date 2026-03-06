{myutils, ...}: {
  imports = myutils.listDir ./. "default.nix";

  # Too small to have a dedicated file:
  services = {
    hyprpolkitagent.enable = true;
    blanket.enable = true;
    easyeffects.enable = true;
  };
}
