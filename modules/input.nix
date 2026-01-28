{pkgs, ...}: {
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    inputMethod = {
      enable = true;

      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;

        addons = with pkgs; [
          fcitx5-mozc-ut
          fcitx5-gtk
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    kdePackages.fcitx5-configtool
  ];
}
