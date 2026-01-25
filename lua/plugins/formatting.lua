-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                     Conform: Formateo de Código                          ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/stevearc/conform.nvim

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Formatear",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Python
      python = { "ruff_format" },

      -- JavaScript/TypeScript
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      -- Frameworks web
      svelte = { "prettier" },
      astro = { "prettier" },
      vue = { "prettier" },

      -- HTML/CSS
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },

      -- Data formats
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },

      -- Lua
      lua = { "stylua" },

      -- Rust
      rust = { "rustfmt" },

      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },

      -- Fallback
      ["_"] = { "trim_whitespace" },
    },

    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true,
    },

    formatters = {
      prettier = {
        prepend_args = { "--single-quote", "--trailing-comma", "es5" },
      },
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
}
