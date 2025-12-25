{
  pkgs,
  lib,
  nil,
  inputs,
  ...
}: let
  rtp = ./rtp;
  pluginConfig = ./plugins;
  readConfig = name: builtins.readFile (lib.path.append pluginConfig name);
  mkPluginEmpty = plugin: name: {
    inherit plugin;
    type = "lua";
    config = ''require("${name}").setup({})'';
  };
  mkPlugin = plugin: conf: {
    inherit plugin;
    type = "lua";
    config = readConfig conf;
  };
in {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    extraPackages =
      [
        nil
      ]
      ++ (with pkgs; [
        # Language Servers
        astro-language-server
        lua-language-server
        vscode-langservers-extracted
        yaml-language-server
        typescript-language-server
        tailwindcss-language-server
        libsForQt5.qt5.qtdeclarative
        gopls
        bash-language-server
        clang-tools
        haskell-language-server
        rust-analyzer

        # Formatters & Linters

        ## Typescript & Javascript
        prettierd
        eslint_d

        ## Nix
        alejandra
        statix

        ## Lua
        selene
        stylua

        # Golang
        golangci-lint

        # Haskell
        hlint
        ormolu

        # Rust
        rustfmt
        clippy

        # Shell
        shfmt
        shellcheck

        # Misc
        bc
        ripgrep
      ]);

    extraLuaConfig = with builtins;
      concatStringsSep "\n" [
        "local config = {}"
        (readFile ./cmds.lua)
        (readFile ./lsp.lua)
        (readFile ./keymaps.lua)
        (readFile ./autocmds.lua)
        (readFile ./options.lua)
        "vim.opt.rtp:prepend('${rtp}/after')"
      ];

    plugins = with pkgs.vimPlugins; [
      # LSP
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      go-nvim
      glance-nvim
      pkgs.vimExtraPlugins.guihua-lua
      inputs.haskell-tools-nvim.packages.${pkgs.stdenv.hostPlatform.system}.default
      (mkPlugin lsp_signature-nvim "lsp_signature-nvim.lua")
      (mkPlugin nvim-lightbulb "nvim-lightbulb.lua")
      (mkPlugin snacks-nvim "snacks-nvim.lua")
      (mkPlugin ts-autotag-nvim "ts-autotag-nvim.lua")
      (mkPluginEmpty inc-rename-nvim "inc_rename")
      (mkPluginEmpty otter-nvim "otter")

      ## Formatting & Linting
      (mkPlugin formatter-nvim "formatter-nvim.lua")
      (mkPlugin nvim-lint "nvim-lint.lua")

      ## Completion
      (mkPlugin nvim-cmp "nvim-cmp.lua")
      cmp-async-path
      cmp-buffer
      cmp-calc
      cmp-cmdline
      cmp-dotenv
      cmp-git
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-tmux
      cmp_luasnip
      luasnip

      # UI
      {
        plugin = tiny-devicons-auto-colors-nvim;
        type = "lua";
        config = ''
          local theme_colors = require("catppuccin.palettes").get_palette("latte")

          require("tiny-devicons-auto-colors").setup({
            colors = theme_colors,
          })
        '';
      }
      (mkPlugin catppuccin-nvim "catppuccin-nvim.lua")
      (mkPlugin edgy-nvim "edgy-nvim.lua")
      (mkPlugin lualine-nvim "lualine-nvim.lua")
      (mkPluginEmpty dashboard-nvim "dashboard")
      (mkPlugin bufferline-nvim "bufferline-nvim.lua")
      (mkPlugin pkgs.vimExtraPlugins.gitsigns-nvim "gitsigns-nvim.lua")
      pkgs.vimExtraPlugins.deadcolumn-nvim
      nui-nvim
      nvim-web-devicons

      # Utils
      (mkPlugin neo-tree-nvim "neo-tree-nvim.lua")
      (mkPlugin toggleterm-nvim "toggleterm-nvim.lua")
      {
        plugin = flatten-nvim;
        type = "lua";
        config = ''
          require("flatten").setup({
            window = { open = "alternate" },
            integrations = { kitty = enable },
          })'';
      }
      (mkPlugin mini-nvim "mini-nvim.lua")
      (mkPlugin telescope-nvim "telescope-nvim.lua")
      (mkPluginEmpty trouble-nvim "trouble")
      leap-nvim
      vim-fugitive
      vim-repeat
      telescope_hoogle
      zen-mode-nvim
      twilight-nvim
      mkdir-nvim

      # Misc
      plenary-nvim
    ];
  };
}
