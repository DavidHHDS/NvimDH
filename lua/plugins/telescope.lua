-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                     Telescope: Buscador Fuzzy                            ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- Necesario para Neovim 0.11+ (tag 0.1.x está roto)
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Ayuda" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recientes" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Comandos" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Atajos" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Símbolos" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Palabra bajo cursor" },
    { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buscar en archivo" },
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<Esc>"] = "close",
        },
        n = {
          ["q"] = "close",
        },
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
      },
      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    pcall(telescope.load_extension, "fzf")
  end,
}
