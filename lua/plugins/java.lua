-- Plugin para suporte avançado a Java no Neovim
-- Inclui LSP, autocompletar, debug e integração com Maven/Gradle
return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      -- Configuração básica: o plugin já detecta projetos Maven/Gradle automaticamente
      -- Para customizações avançadas, consulte: https://github.com/mfussenegger/nvim-jdtls#usage
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ativa o LSP Java (usado como fallback, o nvim-jdtls é o principal)
        jdtls = {},
      },
    },
  },
  -- Plugins recomendados para experiência de IDE
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
}
