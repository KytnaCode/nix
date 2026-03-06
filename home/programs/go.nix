{
  programs.go = {
    enable = true;
    telemetry.mode = "off";
    env = {
      CGO_ENABLED = "0";
    };
  };
}
