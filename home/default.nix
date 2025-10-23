{
  config,
  lib,
  ...
}: {
  imports = [
    ./catppuccin.nix
    ./software.nix
    ./xdg.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "alex";
    homeDirectory = "/home/alex";

    activation = {
      install-flatpak = lib.hm.dag.entryAfter ["installPackages"] ''
        PATH="${config.home.path}/bin:$PATH" FLATPAK_CONFIG_FILE="${./flatpak.json}" run ${./tasks/install-flatpak.sh}
      '';
    };

    file.".profile".text = ''
      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
    '';
  };

  qt = {
    enable = true;

    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      monospace = ["AnonymicePro"];
      sansSerif = ["Montserrat"];
      emoji = ["Symbols"];
      serif = ["Merriweather"];
    };
  };
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
