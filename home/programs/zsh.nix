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
      "nixbg" = "f() { (nix run \"$@\" > /dev/null 2>&1 &) };f";
      "cdtmp" = "cd $(mktemp -d)";
      "rma" = "rm -r * .*";
      "rmaf" = "rm -rf * .*";
      "icat" = "kitty icat";
    };
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "aliases"
        "bun"
        "cabal"
        "common-aliases"
        "copybuffer"
        "direnv"
        "docker"
        "docker-compose"
        "emoji"
        "fancy-ctrl-z"
        "fzf"
        "gh"
        "git"
        "gitignore"
        "golang"
        "gpg-agent"
        "kitty"
        "lol"
        "nmap"
        "node"
        "podman"
        "python"
        "qrcode"
        "rsync"
        "rust"
        "safe-paste"
        "ssh"
        "stack"
        "systemd"
        "tmux"
      ];
    };
  };
}
