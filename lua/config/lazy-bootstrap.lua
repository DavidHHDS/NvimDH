-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                       Bootstrap de Lazy.nvim                             ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/folke/lazy.nvim#-installation

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Instalar lazy.nvim si no existe
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configurar lazy.nvim
require("lazy").setup({
  spec = {
    -- Importar todos los plugins desde lua/plugins/
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    -- Logo personalizado con iniciales "DH"
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = "",
      task = "✔ ",
      lazy = "󰒲 ",
    },
  },
})
