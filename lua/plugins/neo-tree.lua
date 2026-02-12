-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                       Neo-tree: Explorador de Archivos                   ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/nvim-neo-tree/neo-tree.nvim
-- Keymaps alineados con LazyVim: https://www.lazyvim.org/extras/editor/neo-tree

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorador (toggle)" },
    { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Revelar archivo actual" },
    { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explorador (toggle)" },
    { "<leader>fE", "<cmd>Neotree reveal<cr>", desc = "Explorador (revelar)" },
    { "<leader>be", "<cmd>Neotree buffers<cr>", desc = "Explorador buffers" },
    { "<leader>ge", "<cmd>Neotree git_status<cr>", desc = "Explorador git" },
  },
  -- Abrir Neo-tree automáticamente al entrar a un directorio
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
      desc = "Start Neo-tree with directory",
      once = true,
      callback = function()
        if package.loaded["neo-tree"] then
          return
        end
        local stats = vim.uv.fs_stat(vim.fn.argv(0))
        if stats and stats.type == "directory" then
          require("neo-tree")
        end
      end,
    })
  end,
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
          ".git",
          "__pycache__",
          ".DS_Store",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
    window = {
      position = "left",
      width = 35,
      mappings = {
        -- Navegación estilo LazyVim
        ["<space>"] = "none",
        ["<cr>"] = "open",
        ["l"] = "open",
        ["h"] = "close_node",
        ["o"] = "open",

        -- Splits
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["t"] = "open_tabnew",

        -- Operaciones de archivos
        ["a"] = "add",
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy",
        ["m"] = "move",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",

        -- Utilidades
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",

        -- Copiar ruta al clipboard del sistema (LazyVim)
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
            vim.notify("Ruta copiada: " .. path)
          end,
          desc = "Copiar ruta al clipboard",
        },

        -- Abrir con aplicación del sistema (LazyVim)
        ["O"] = {
          function(state)
            local path = state.tree:get_node().path
            vim.ui.open(path)
          end,
          desc = "Abrir con app del sistema",
        },

        -- Preview sin flotante (LazyVim)
        ["P"] = { "toggle_preview", config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "*",
      },
      modified = {
        symbol = "[+]",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "󰱒",
          conflict = "",
        },
      },
    },
  },
}
