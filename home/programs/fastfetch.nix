{
  programs.fastfetch = {
    enable = true;
    settings = {
      general.thread = true;

      modules = [
        "bluetooth"
        "cpu"
        "datetime"
        "editor"
        "font"
        "gpu"
        "icons"
        "initSystem"
        "memory"
        "monitor"
        "mouse"
        "os"
        "shell"
        "terminal"
      ];
    };
  };
}
