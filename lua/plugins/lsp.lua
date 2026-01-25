-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                      LSP Configuration (Neovim 0.11+)                    ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/neovim/nvim-lspconfig
-- NOTA: require('lspconfig') está DEPRECADO en Neovim 0.11+
--       Ahora usamos vim.lsp.config() y vim.lsp.enable()

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Diagnósticos con iconos modernos
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        source = "if_many",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
      },
    })

    -- Configuración de handlers con bordes
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "rounded" }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = "rounded" }
    )

    -- Keymaps cuando LSP se conecta
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
        end

        -- Navegación
        map("n", "gd", vim.lsp.buf.definition, "Ir a definición")
        map("n", "gD", vim.lsp.buf.declaration, "Ir a declaración")
        map("n", "gr", vim.lsp.buf.references, "Ver referencias")
        map("n", "gi", vim.lsp.buf.implementation, "Ir a implementación")
        map("n", "gt", vim.lsp.buf.type_definition, "Tipo de definición")
        
        -- Información
        map("n", "K", vim.lsp.buf.hover, "Información hover")
        map("n", "<C-k>", vim.lsp.buf.signature_help, "Firma de función")
        map("i", "<C-k>", vim.lsp.buf.signature_help, "Firma de función")
        
        -- Acciones
        map("n", "<leader>la", vim.lsp.buf.code_action, "Acciones de código")
        map("n", "<leader>ln", vim.lsp.buf.rename, "Renombrar símbolo")
        map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Formatear")
      end,
    })

    -- ══════════════════════════════════════════════════════════════════════
    -- Configuraciones de servidores LSP usando vim.lsp.config (Neovim 0.11+)
    -- ══════════════════════════════════════════════════════════════════════

    -- TypeScript/JavaScript
    vim.lsp.config("ts_ls", {
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
          },
        },
      },
    })

    -- Python
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    -- Lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Rust
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" },
        },
      },
    })

    -- Habilitar todos los servidores
    local servers = {
      "ts_ls",        -- TypeScript/JavaScript
      "pyright",         -- Python
      "lua_ls",          -- Lua
      "rust_analyzer",   -- Rust
      "svelte",          -- Svelte
      "astro",           -- Astro
      "angularls",       -- Angular
      "html",            -- HTML
      "cssls",           -- CSS
      "jsonls",          -- JSON
      "yamlls",          -- YAML
      "marksman",        -- Markdown
      "lemminx",         -- XML
      "emmet_ls",        -- Emmet
      "tailwindcss",     -- Tailwind
    }

    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
