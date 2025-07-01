-- ================= MANUAL DE CONFIGURAÇÃO DO NEOVIM COM LAZYVIM =================
--
-- Este arquivo configura o LazyVim, o gerenciador de plugins e o carregamento dos plugins personalizados.
--
-- COMO USAR ESTE ARQUIVO:
--
-- 1. Para adicionar ou modificar plugins, crie arquivos em lua/plugins/ com o nome do plugin ou da configuração desejada.
--    Exemplos: onedark.lua (tema), lsp.lua (LSP), java.lua (Java), etc.
--
-- 2. Cada arquivo em lua/plugins/ deve retornar uma tabela com a especificação do plugin.
--    Veja exemplos práticos abaixo.
--
-- 3. Para temas, crie um arquivo como onedark.lua:
--      return {
--        {
--          "navarasu/onedark.nvim",
--          priority = 1000,
--          config = function()
--            require('onedark').setup { style = 'deep' }
--            require('onedark').load()
--          end,
--        },
--      }
--
-- 4. Para configurar LSP (exemplo para Python e TypeScript):
--      return {
--        {
--          "neovim/nvim-lspconfig",
--          opts = {
--            servers = {
--              pyright = {},
--              tsserver = {},
--            },
--          },
--        },
--      }
--
-- 5. Para suporte avançado a Java (experiência de IDE):
--      Crie lua/plugins/java.lua com o conteúdo sugerido no manual.
--
-- 6. Após salvar qualquer arquivo de plugin, reinicie o Neovim ou rode :Lazy sync para aplicar as mudanças.
-- ===============================================================================

-- Caminho para o lazy.nvim (gerenciador de plugins)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Se o lazy.nvim não estiver instalado, faz o clone automaticamente
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Falha ao clonar lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPressione qualquer tecla para sair..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configuração principal do LazyVim e plugins
require("lazy").setup({
  spec = {
    -- Importa os plugins padrões do LazyVim
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Importa todos os plugins customizados criados em lua/plugins/
    { import = "plugins" },
  },
  defaults = {
    -- Se quiser que seus plugins customizados sejam carregados de forma "lazy", altere para true
    lazy = false,
    -- Recomenda-se deixar version=false para evitar problemas com versões antigas de plugins
    version = false, -- sempre usa o commit mais recente
    -- version = "*", -- use esta linha para instalar a versão estável mais recente dos plugins que suportam semver
  },
  -- Defina aqui o tema principal do Neovim. Altere o nome conforme o tema desejado (ex: "onedark", "kanagawa", "carbonfox")
  install = { colorscheme = { "onedark" } },
  checker = {
    enabled = true, -- Habilita verificação periódica de atualizações dos plugins
    notify = false, -- Notifica quando houver atualização
  },
  performance = {
    rtp = {
      -- Lista de plugins nativos do Vim/Neovim que serão desabilitados para melhorar a performance
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
