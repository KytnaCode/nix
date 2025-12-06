{
  xdg.systemDirs.data = ["/home/alex/.local/share"];

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

    defaultApplications = {
      "text/html" = "com.microsoft.Edge.desktop";
      "x-scheme-handler/http" = "com.microsoft.Edge.desktop";
      "x-scheme-handler/https" = "com.microsoft.Edge.desktop";
      "x-scheme-handler/about" = "com.microsoft.Edge.desktop";
      "x-scheme-handler/unknown" = "com.microsoft.Edge.desktop";
      "x-scheme-handler/chrome" = "com.microsoft.Edge.desktop";
      "application/x-extension-htm" = "com.microsoft.Edge.desktop";
      "application/x-extension-html" = "com.microsoft.Edge.desktop";
      "application/x-extension-shtml" = "com.microsoft.Edge.desktop";
      "application/xhtml+xml" = "com.microsoft.Edge.desktop";
      "application/x-extension-xhtml" = "com.microsoft.Edge.desktop";
      "application/x-extension-xht" = "com.microsoft.Edge.desktop";
    };
  };
}
