-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                       nvim-lint: Linting                                 ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/mfussenegger/nvim-lint

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- Python
      python = { "ruff" },

      -- JavaScript/TypeScript
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },

      -- Frameworks web
      svelte = { "eslint_d" },
      vue = { "eslint_d" },

      -- Data formats
      yaml = { "yamllint" },
      markdown = { "markdownlint" },

      -- Shell
      sh = { "shellcheck" },
      bash = { "shellcheck" },
    }

    -- Lint automático
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keymap para lint manual
    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Ejecutar linter" })
  end,
}
