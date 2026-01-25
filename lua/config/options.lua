-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                         Opciones de Neovim                               ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://www.lazyvim.org/configuration/general

local opt = vim.opt

-- Leader key (compatible con Zellij - evita Ctrl+)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Números de línea
opt.number = true
opt.relativenumber = true

-- Tabs y espacios
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Búsqueda
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Apariencia
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- Archivos
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Comportamiento
opt.splitbelow = true
opt.splitright = true
opt.mouse = "a"
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"

-- ══════════════════════════════════════════════════════════════════════════════
-- CLIPBOARD
-- y/p: registro interno de Neovim
-- <leader>y / <leader>p: portapapeles del sistema
-- ══════════════════════════════════════════════════════════════════════════════

-- NO usar clipboard del sistema por defecto (y/p quedan internos)
-- opt.clipboard = "unnamedplus"

-- Usar OSC 52 para copiar al sistema (Neovim 0.10+ soporta esto nativamente)
-- Esto permite que el yank al registro + funcione incluso en SSH/tmux
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    -- Para pegar, usamos xsel como fallback (OSC 52 paste no siempre funciona)
    ["+"] = "xsel --clipboard --output",
    ["*"] = "xsel --primary --output",
  },
}

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Columna de límite
opt.colorcolumn = "100"

-- Ocultar modo (lo muestra lualine)
opt.showmode = false
