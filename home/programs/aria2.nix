{
  programs.aria2 = {
    enable = true;
    settings = {
      lowest-speed-limit = 128;
      max-connection-per-server = 2;
      max-file-not-found = 3;
      max-tries = 6;
      remote-time = true;
      timeout = 45;
      http-accept-gzip = true;
      stderr = true;
    };
  };
}
