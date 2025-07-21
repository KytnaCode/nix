{
  pkgs,
  lib,
  nil,
  ...
}: let
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
        lua-language-server
        vscode-json-languageserver
        yaml-language-server
        typescript-language-server
        kdePackages.qtdeclarative
        gopls
        clang-tools

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

        # Misc
        bc
        ripgrep
      ]);

    extraLuaConfig = with builtins;
      concatStringsSep "\n" [
        "local config = {}"
        (readFile ./lsp.lua)
        (readFile ./keymaps.lua)
        (readFile ./autocmds.lua)
        (readFile ./options.lua)
      ];

    plugins = with pkgs.vimPlugins; [
      # LSP
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      go-nvim
      glance-nvim
      pkgs.vimExtraPlugins.guihua-lua
      (mkPlugin lsp_signature-nvim "lsp_signature-nvim.lua")
      (mkPlugin nvim-lightbulb "nvim-lightbulb.lua")
      (mkPlugin snacks-nvim "snacks-nvim.lua")
      (mkPluginEmpty inc-rename-nvim "inc_rename")
      (mkPluginEmpty otter-nvim "otter")

      ## Formatting & Linting
      (mkPlugin formatter-nvim "formatter-nvim.lua")
      (mkPlugin nvim-lint "nvim-lint.lua")

      ## Completion
      (mkPlugin coq_nvim "coq_nvim.lua")
      coq-thirdparty
      coq-artifacts

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
      (mkPlugin gitsigns-nvim "gitsigns-nvim.lua")
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
      (mkPluginEmpty trouble-nvim "trouble")
      leap-nvim
      vim-fugitive
      vim-repeat
      telescope-nvim
      zen-mode-nvim
      twilight-nvim

      # Misc
      plenary-nvim
    ];
  };
}
