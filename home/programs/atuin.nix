{
  programs.atuin = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      style = "auto";
      max_preview_height = 5;
      exit_mode = "return-query";
    };
  };
}
