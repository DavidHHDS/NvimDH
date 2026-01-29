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
-- CLIPBOARD con OSC52
-- Fuente: https://github.com/ojroques/nvim-osc52
-- Docs Neovim: :h clipboard-osc52
-- ══════════════════════════════════════════════════════════════════════════════
--
-- IMPORTANTE: OSC52 es un protocolo de SOLO ESCRITURA al clipboard del sistema.
-- ¡NO puede LEER el clipboard del sistema!
--
-- Comportamiento:
--   COPIAR desde Neovim al sistema:
--     - <leader>y  → Copia al clipboard del sistema (funciona en SSH/remoto)
--     - Funciona porque OSC52 ESCRIBE al clipboard de la terminal
--
--   PEGAR desde el sistema a Neovim:
--     - Ctrl+Shift+V → Usa el paste de la TERMINAL (WezTerm/iTerm2/etc)
--     - <leader>p solo pega texto copiado DENTRO de esta sesión de Neovim
--     - OSC52 NO puede leer el clipboard externo
--
-- ══════════════════════════════════════════════════════════════════════════════

-- NO usar clipboard del sistema por defecto (y/p quedan internos)
-- opt.clipboard = "unnamedplus"

-- Usar OSC 52 para copiar al sistema (Neovim 0.10+ soporta esto nativamente)
-- Caché interna para texto copiado DENTRO de Neovim (paste externo: Ctrl+Shift+V)
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
