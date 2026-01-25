-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                    Configuración Personal de Neovim                       ║
-- ║                              Por: DH                                      ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://www.lazyvim.org/configuration
-- Fuente: https://github.com/folke/lazy.nvim

-- Cargar opciones primero
require("config.options")

-- Cargar bootstrap de lazy.nvim
require("config.lazy-bootstrap")

-- Cargar keymaps después de que los plugins estén cargados
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.keymaps")
    require("config.autocmds")
  end,
})
