{
  programs.clock-rs = {
    enable = true;

    settings = {
      general = {
        color = "magenta";
        bold = true;
      };

      date = {
        fmt = "%A, $B $d, $Y";
        use_12h = true;
      };
    };
  };
}
