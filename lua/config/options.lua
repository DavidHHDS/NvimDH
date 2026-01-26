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
-- Implementamos una caché interna para "paste" porque osc52 read no es fiable/rápido
-- y xsel falla en entornos sin X11.
local osc52 = require("vim.ui.clipboard.osc52")
local clipboard_cache = { ["+"] = {}, ["*"] = {} }

local function copy(register)
  return function(lines, type)
    clipboard_cache[register] = { lines = lines, type = type }
    osc52.copy(register)(lines, type)
  end
end

local function paste(register)
  return function()
    local content = clipboard_cache[register]
    if content and content.lines then
      return content.lines, content.type
    end
    return nil -- O retornar lista vacía {}
  end
end

vim.g.clipboard = {
  name = "OSC 52 (Cached)",
  copy = {
    ["+"] = copy("+"),
    ["*"] = copy("*"),
  },
  paste = {
    ["+"] = paste("+"),
    ["*"] = paste("*"),
  },
}

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Columna de límite
opt.colorcolumn = "100"

-- Ocultar modo (lo muestra lualine)
opt.showmode = false
