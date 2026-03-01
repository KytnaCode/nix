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
      "runbg" = "f() { (\"$@\" > /dev/null 2>&1 &) };f";
      "cdtmp" = "cd $(mktemp -d)";
      "rma" = "rm -r * .*";
      "rmaf" = "rm -rf * .*";
    };
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "alias-finder"
        "aliases"
        "aws"
        "azure"
        "bun"
        "cabal"
        "colored-man-pages"
        "command-not-found"
        "common-aliases"
        "direnv"
        "docker"
        "docker-compose"
        "dotenv"
        "fancy-ctrl-z"
        "fzf"
        "gh"
        "git"
        "github"
        "gitignore"
        "golang"
        "gpg-agent"
        "kitty"
        "lol"
        "mongocli"
        "ngork"
        "nmap"
        "node"
        "npm"
        "pip"
        "podman"
        "postgres"
        "python"
        "qrcode"
        "rsync"
        "rust"
        "safe-paste"
        "sbt"
        "scala"
        "ssh"
        "stack"
        "systemd"
        "tmux"
        "tmuxinator"
        "zoxide"
      ];
    };
  };
}
