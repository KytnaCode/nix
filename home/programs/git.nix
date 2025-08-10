{
  programs.git = {
    enable = true;

    ignores = [
      ".nvim.lua"
      "Makefile.local"
      "Session.vim"
    ];

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      credential.helper = ["cache --timeout 18000"];

      push.autoSetupRemote = true;
    };

    userEmail = "kytnacode@gmail.com";
    userName = "kytnacode";
  };

  programs.git-credential-oauth.enable = true;
}
