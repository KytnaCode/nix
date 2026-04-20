{user, ...}: {
  xdg.systemDirs.data = ["/home/${user}/.local/share"];

  xdg.desktopEntries = {
    manuskript = {
      type = "Application";
      name = "Manuskript";
      genericName = "Novel Writter";
      comment = "Open-source tool for writters";
      categories = ["Office" "WordProcessor" "TextTools" "Literature"];
      exec = "manuskript";
      terminal = false;
    };
  };

  xdg.mime.enable = true;

  xdg.mimeApps = {
    enable = true;

    defaultApplications = let
      browser = "com.brave.Browser.desktop";
    in {
      "text/html" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;
      "x-scheme-handler/chrome" = browser;
      "application/x-extension-htm" = browser;
      "application/x-extension-html" = browser;
      "application/x-extension-shtml" = browser;
      "application/xhtml+xml" = browser;
      "application/x-extension-xhtml" = browser;
      "application/x-extension-xht" = browser;
    };
  };
}
