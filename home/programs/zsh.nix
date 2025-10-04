{
  programs.zsh = {
    enable = true;

    autocd = true;
    enableVteIntegration = true;
    shellAliases = {
      "switch" = "sudo nixos-rebuild switch";
      "snvim" = "sudo -E nvim";
      "lmake" = "make -f Makefile.local";
      "todayf" = "touch \"$(date --iso-8601)\"";
      "todayd" = "mkdir \"$(date --iso-8601)\"";
      "cdtoday" = "cd \"$(date --iso-8601)\"";
      "useflake" = "echo \"use_flake\" >> .envrc";
      "runbg" = "f() { (\"$@\" 2>&1 > /dev/null &) };f";
    };
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "alias-finder"
        "aliases"
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
        "rust"
        "sbt"
        "scala"
        "ssh"
        "stack"
        "tmux"
        "tmuxinator"
        "zoxide"
      ];
    };
  };
}
