{
  home.file.".wallpaper.png".source = ./wallpaper.png;

  services.hyprpaper = {
    enable = true;

    settings = {
      splash = true;

      preload = "~/.wallpaper.png";

      wallpaper = ", ~/.wallpaper.png";
    };
  };
}
