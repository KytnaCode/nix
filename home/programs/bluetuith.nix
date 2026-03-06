{user, ...}: {
  programs.bluetuith = {
    enable = true;
    settings = {
      confirm-on-quit = true;
      receive-dir = "/home/${user}/files";
    };
  };
}
