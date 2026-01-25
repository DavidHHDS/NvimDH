-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                   Treesitter: Resaltado de Sintaxis                      ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  lazy = false,
  priority = 100,
  config = function()
    -- Configurar parsers a instalar
    local ts = require("nvim-treesitter")
    ts.setup({
      ensure_installed = {
        "javascript", "typescript", "tsx", "python", "html", "css",
        "json", "jsonc", "markdown", "markdown_inline", "yaml",
        "lua", "luadoc", "rust", "xml", "vim", "vimdoc",
        "bash", "regex", "toml", "svelte", "astro",
      },
    })

    -- Parche de compatibilidad para Telescope y otros plugins
    -- que esperan la vieja API de nvim-treesitter
    local parsers = require("nvim-treesitter.parsers")
    
    -- Crear función ft_to_lang si no existe
    if not parsers.ft_to_lang then
      parsers.ft_to_lang = function(ft)
        local lang = vim.treesitter.language.get_lang(ft)
        return lang or ft
      end
    end

    -- Crear función get_parser_configs si no existe  
    if not parsers.get_parser_configs then
      parsers.get_parser_configs = function()
        return parsers.configs or {}
      end
    end

    -- Crear módulo de highlight con is_enabled
    local ok, highlight = pcall(require, "nvim-treesitter.highlight")
    if not ok then
      highlight = {}
    end
    if not highlight.is_enabled then
      highlight.is_enabled = function(bufnr)
        return vim.treesitter.highlighter.active[bufnr or 0] ~= nil
      end
    end
    -- Asegurarse de que el módulo esté disponible
    package.loaded["nvim-treesitter.highlight"] = highlight

    -- Habilitar resaltado para todos los buffers
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local ft = vim.bo[buf].filetype
        if ft and ft ~= "" then
          pcall(vim.treesitter.start, buf)
        end
      end,
    })
  end,
}
