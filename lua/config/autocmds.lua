-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                         Autocomandos                                     ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://www.lazyvim.org/configuration/general

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      Resaltado de Yank                                   │
-- └──────────────────────────────────────────────────────────────────────────┘

autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                    Recordar posición del cursor                          │
-- └──────────────────────────────────────────────────────────────────────────┘

autocmd("BufReadPost", {
  group = augroup("last_loc", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      Cerrar ventanas con q                               │
-- └──────────────────────────────────────────────────────────────────────────┘

autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = {
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                            Wrap en Markdown                              │
-- └──────────────────────────────────────────────────────────────────────────┘

autocmd("FileType", {
  group = augroup("wrap_spell", { clear = true }),
  pattern = { "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                  Auto crear directorio al guardar                        │
-- └──────────────────────────────────────────────────────────────────────────┘

autocmd("BufWritePre", {
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                    Formato automático al guardar                         │
-- └──────────────────────────────────────────────────────────────────────────┘

autocmd("BufWritePre", {
  group = augroup("auto_format", { clear = true }),
  callback = function()
    local ok, conform = pcall(require, "conform")
    if ok then
      conform.format({ async = false, lsp_fallback = true })
    end
  end,
})
