-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                    Mason: Gestor de Herramientas                         ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/mason-org/mason.nvim
-- Sintaxis moderna para lazy.nvim

return {
  -- Mason base
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
    },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "rounded",
      },
    },
  },

  -- Mason-lspconfig (integración con LSP)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        -- LSPs requeridos
        "ts_ls",           -- TypeScript/JavaScript
        "pyright",            -- Python
        "svelte",             -- Svelte
        "astro",              -- Astro
        "angularls",          -- Angular
        "html",               -- HTML
        "cssls",              -- CSS
        "jsonls",             -- JSON
        "marksman",           -- Markdown
        "yamlls",             -- YAML
        "lua_ls",             -- Lua
        "rust_analyzer",      -- Rust
        "lemminx",            -- XML
        "emmet_ls",           -- Emmet
        "tailwindcss",        -- Tailwind CSS
      },
      automatic_installation = true,
    },
  },

  -- Mason-tool-installer (linters y formatters)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Python
        "ruff",               -- Linter + Formatter
        "debugpy",            -- Debugger
        
        -- JavaScript/TypeScript/Web
        "prettier",           -- Formatter universal
        "eslint_d",           -- Linter JS/TS
        
        -- Lua
        "stylua",             -- Formatter
        
        -- Shell
        "shfmt",              -- Formatter
        "shellcheck",         -- Linter
        
        -- YAML/JSON/Markdown
        "yamllint",
        "markdownlint",
      },
      auto_update = true,
      run_on_start = true,
    },
  },
}
