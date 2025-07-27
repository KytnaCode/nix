{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = "40%";
      allow_images = true;
      allow_markup = true;
      hide_scroll = true;
      matching = "fuzzy";
      insensitive = true;
      image_size = 26;
      key_expand = "space";
    };
  };
}
