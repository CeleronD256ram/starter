return {
   {
      "stevearc/conform.nvim",
      -- event = 'BufWritePre', -- uncomment for format on save
      opts = require "configs.conform",
   },

   -- These are some examples, uncomment them if you want to see them work!
   {
      "neovim/nvim-lspconfig",
      config = function()
         require ("nvchad.configs.lspconfig").defaults()
         require "configs.lspconfig"
      end,
   },

   {
      "williamboman/mason.nvim",
      opts = {
         ensure_installed = {
            "lua-language-server",
            "stylua",
            "html-lsp",
            "css-lsp",
            "prettier",
            "omnisharp",
         },
      },
   },

   { -- This plugin
      "Zeioth/compiler.nvim",
      cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
      dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
      opts = {},
   },
   { -- The task runner we use
      "stevearc/overseer.nvim",
      commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
      cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
      opts = {
         task_list = {
            direction = "bottom",
            min_height = 25,
            max_height = 25,
            default_detail = 1
         },
      },
   },




   -- test new blink
   -- { import = "nvchad.blink.lazyspec" },

   {
      "nvim-treesitter/nvim-treesitter",
      opts = {
         ensure_installed = {
            "vim", "lua", "vimdoc",
            "html", "css", "c_sharp"
         },
      },
   },
}
