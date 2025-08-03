require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
-- omnisharp languageserver
local pid = vim.fn.getpid()

lspconfig.omnisharp.setup({
   cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
   on_attach = nvlsp.on_attach,
   on_init = nvlsp.on_init,
   capabilities = nvlsp.capabilities,
})
-- read :h vim.lsp.config for changing options of lsp servers 
