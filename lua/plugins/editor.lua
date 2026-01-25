-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                     Plugins de Productividad                             ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuentes oficiales consultadas para cada plugin

return {
  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                       Which-key: Guía de atajos                         │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/folke/which-key.nvim (v3 sintaxis)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      icons = {
        mappings = true,
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "󰘴 ",
          M = "󰘵 ",
          S = "󰘶 ",
          CR = "󰌑 ",
          Esc = "󱊷 ",
          NL = "󰌑 ",
          BS = "󰁮",
          Space = "󱁐 ",
          Tab = "󰌒 ",
        },
      },
      spec = {
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Código" },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "Buscar" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>x", group = "Diagnósticos" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Atajos locales",
      },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                        Autopairs: Cierre automático                      │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)

      -- Integración con cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                        Comment: Comentarios                              │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                      Surround: Rodear texto                              │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/echasnovski/mini.surround
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "sa", -- Add surroundring in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                       Gitsigns: Indicadores Git                          │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Siguiente hunk")
        map("n", "[h", gs.prev_hunk, "Hunk anterior")
        map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>gb", gs.blame_line, "Blame línea")
        map("n", "<leader>gd", gs.diffthis, "Diff")
        map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Unstage hunk")
      end,
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                        LazyGit: Git TUI                                  │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/kdheepak/lazygit.nvim
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                       Todo Comments: Resaltado                           │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Siguiente TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "TODO anterior" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Buscar TODOs" },
    },
  },

  -- ┌──────────────────────────────────────────────────────────────────────────┐
  -- │                    Trouble: Lista de diagnósticos                        │
  -- └──────────────────────────────────────────────────────────────────────────┘
  -- Fuente: https://github.com/folke/trouble.nvim (v3 sintaxis)
  {
    "folke/trouble.nvim",
    branch = "main",
    cmd = { "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnósticos" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnósticos buffer" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
      { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Símbolos" },
    },
    opts = {
      modes = {
        symbols = {
          focus = true,
        },
      },
    },
  },
}
