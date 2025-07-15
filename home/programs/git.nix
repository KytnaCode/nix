{
  programs.git = {
    enable = true;

    ignores = [
      ".nvim.lua"
      "Makefile.local"
    ];

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      push.autoSetupRemote = true;
    };

    userEmail = "kytnacode@gmail.com";
    userName = "kytnacode";
  };

  programs.git-credential-oauth.enable = true;
}
