require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "bashls",
  "dockerls",
  "jsonls",
  "lua_ls",
  "marksman",
  "sqlls",
  "tailwindcss",
  "yamlls",
}

for _, lsp in ipairs(servers) do
   lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
   }
end

lspconfig.csharp_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = require('lspconfig.util').root_pattern("*.sln")
}
-- read :h vim.lsp.config for changing options of lsp servers 
