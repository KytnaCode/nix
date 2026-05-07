{pkgs, ...}: {
  programs = {
    zsh.enable = true;

    localsend = {
      enable = true;
      openFirewall = true;
    };

    steam.enable = true;
  };

  services = {
    flatpak.enable = true;

    gnome.gnome-keyring.enable = true;
  };

  environment.systemPackages = with pkgs; [
    qt6.qtbase
    hunspell
    hunspellDicts.es_MX
    hunspellDicts.en_US
  ];
}
