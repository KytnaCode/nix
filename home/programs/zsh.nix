{
  programs.zsh = {
    enable = true;

    autocd = true;
    enableVteIntegration = true;
    shellAliases = {
      "switch" = "sudo nixos-rebuild switch";
      "snvim" = "sudo -E nvim";
      "lmake" = "make -f Makefile.local";
    };
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "aliases"
        "alias-finder"
        "aws"
        "azure"
        "cabal"
        "colored-man-pages"
        "command-not-found"
        "common-aliases"
        "docker"
        "docker-compose"
        "dotenv"
        "fancy-ctrl-z"
        "fzf"
        "git"
        "github"
        "gitignore"
        "golang"
        "gpg-agent"
        "kitty"
        "lol"
        "mongocli"
        "nmap"
        "node"
        "npm"
        "pip"
        "podman"
        "postgres"
        "sbt"
        "scala"
        "ssh"
        "tmux"
        "tmuxinator"
        "zoxide"
      ];
    };
  };
}
