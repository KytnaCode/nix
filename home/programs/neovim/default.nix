{
  pkgs,
  lib,
  system,
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
        inputs.nil.packages.${system}.default
      ]
      ++ (with pkgs; [
        # Language Servers
        astro-language-server
        bash-language-server
        clang-tools
        docker-language-server
        gopls
        haskell-language-server
        libsForQt5.qt5.qtdeclarative
        lua-language-server
        rust-analyzer
        tailwindcss-language-server
        typescript-language-server
        vscode-langservers-extracted
        yaml-language-server

        # Debugging
        gdb
        lldb
        vscode-extensions.vadimcn.vscode-lldb.adapter

        # Formatters & Linters

        ## Typescript & Javascript
        eslint_d
        prettierd

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
        clippy
        rustfmt

        # Shell
        shellcheck
        shfmt

        # Misc
        bc
        luajitPackages.jsregexp
        ripgrep
      ]);

    initLua = with builtins; let
      snippets = ''
        require("luasnip.loaders.from_vscode").lazy_load({
          paths = "${./snippets}",
        })
      '';
      early = lib.mkOrder 100 (concatStringsSep "\n" [
        "local config = {}"
        (readFile ./options.lua)
        (readFile ./filetype.lua)
      ]);
      late = lib.mkAfter (concatStringsSep "\n" [
        (readFile ./lsp.lua)
        (readFile ./cmds.lua)
        (readFile ./keymaps.lua)
        (readFile ./autocmds.lua)
        snippets
        "vim.opt.rtp:prepend('${rtp}/after')"
      ]);
    in
      lib.mkMerge [early late];

    plugins = with pkgs.vimPlugins; [
      # LSP
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      glance-nvim
      pkgs.vimExtraPlugins.guihua-lua-ray-x
      rustaceanvim
      inputs.haskell-tools-nvim.packages.${pkgs.stdenv.hostPlatform.system}.default
      SchemaStore-nvim
      (mkPlugin lspsaga-nvim "lspsaga-nvim.lua")
      (mkPlugin nvim-lightbulb "nvim-lightbulb.lua")
      (mkPlugin snacks-nvim "snacks-nvim.lua")
      (mkPlugin ts-autotag-nvim "ts-autotag-nvim.lua")
      (mkPluginEmpty otter-nvim "otter")
      (mkPluginEmpty go-nvim "go")

      # Debugging
      (mkPlugin nvim-dap "nvim-dap.lua")
      (mkPluginEmpty nvim-dap-ui "dapui")

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
      (mkPlugin pkgs.vimExtraPlugins.gitsigns-nvim-lewis6991 "gitsigns-nvim.lua")
      pkgs.vimExtraPlugins.deadcolumn-nvim-Bekaboo
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
      (mkPlugin pkgs.vimExtraPlugins.telescope-nvim-nvim-telescope "telescope-nvim.lua")
      (mkPlugin twilight-nvim "twilight-nvim.lua")
      (mkPluginEmpty trouble-nvim "trouble")
      leap-nvim
      vim-fugitive
      vim-repeat
      telescope_hoogle
      zen-mode-nvim
      mkdir-nvim

      # Misc
      plenary-nvim
    ];
  };
}
