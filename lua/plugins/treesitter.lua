-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                   Treesitter: Resaltado de Sintaxis                      ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Usar versión master (recomendado por nvim-treesitter)
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },
  opts = {
    ensure_installed = {
      "javascript", "typescript", "tsx", "python", "html", "css",
      "json", "jsonc", "markdown", "markdown_inline", "yaml",
      "lua", "luadoc", "rust", "xml", "vim", "vimdoc",
      "bash", "regex", "toml", "svelte", "astro",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
q