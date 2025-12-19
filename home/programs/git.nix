{pkgs, ...}: {
  programs.git = {
    enable = true;

    ignores = [
      ".nvim.lua"
      "Makefile.local"
      "Session.vim"
    ];

    settings = {
      init = {
        defaultBranch = "main";
      };

      credential.helper = [
        "${
          pkgs.git.override {withLibsecret = true;}
        }/bin/git-credential-libsecret"
      ];

      push.autoSetupRemote = true;

      user.email = "kytnacode@gmail.com";
      user.name = "kytnacode";
    };
  };

  programs.git-credential-oauth.enable = true;
}
