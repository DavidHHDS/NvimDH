-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                         UI: Tema y Dashboard                             ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Tema: Catppuccin Mocha con fondo negro OLED

return {
  -- Tema Catppuccin (optimizado para OLED)
  -- Fuente: https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        keywords = { "italic" },
      },
      color_overrides = {
        mocha = {
          -- Fondo negro puro para OLED
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        neotree = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          -- Separador visible entre Neo-tree y código
          WinSeparator = { fg = colors.surface2, bg = "NONE" },
          NeoTreeWinSeparator = { fg = colors.surface2, bg = "NONE" },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Dashboard con logo "DH" centrado
  -- Fuente: https://github.com/goolord/alpha-nvim
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      
      -- Logo DH centrado
      dashboard.section.header.val = {
        "",
        "",
        "    ██████╗ ██╗  ██╗    ",
        "    ██╔══██╗██║  ██║    ",
        "    ██║  ██║███████║    ",
        "    ██║  ██║██╔══██║    ",
        "    ██████╔╝██║  ██║    ",
        "    ╚═════╝ ╚═╝  ╚═╝    ",
        "",
        "",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Buscar archivo", "<cmd>Telescope find_files<cr>"),
        dashboard.button("r", "  Recientes", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "  Buscar texto", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("e", "  Explorador", "<cmd>Neotree toggle<cr>"),
        dashboard.button("c", "  Configuracion", "<cmd>e $MYVIMRC<cr>"),
        dashboard.button("l", "  Lazy", "<cmd>Lazy<cr>"),
        dashboard.button("m", "  Mason", "<cmd>Mason<cr>"),
        dashboard.button("q", "  Salir", "<cmd>qa<cr>"),
      }

      dashboard.section.footer.val = "Neovim"

      -- Centrar header
      dashboard.section.header.opts.position = "center"
      dashboard.section.buttons.opts.position = "center"
      dashboard.section.footer.opts.position = "center"

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      -- Espaciado vertical para centrar
      -- Calcular padding para centrar: (altura_ventana - altura_contenido) / 2
      local function get_padding()
        local win_height = vim.fn.winheight(0)
        local header_height = #dashboard.section.header.val
        local buttons_height = #dashboard.section.buttons.val * 2
        local footer_height = 1
        local content_height = header_height + buttons_height + footer_height + 4
        local padding = math.max(0, math.floor((win_height - content_height) / 2))
        return padding
      end

      dashboard.config.layout = {
        { type = "padding", val = get_padding },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      return dashboard.config
    end,
    config = function(_, config)
      require("alpha").setup(config)
    end,
  },

  -- Lualine: Barra de estado
  -- Fuente: https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Bufferline: Tabs de buffers
  -- Fuente: https://github.com/akinsho/bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorador",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },

  -- Indent blankline: Guías de indentación
  -- Fuente: https://github.com/lukas-reineke/indent-blankline.nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
      },
    },
  },
  -- Virt-column: línea delgada en lugar del colorcolumn ancho
  -- Fuente: https://github.com/lukas-reineke/virt-column.nvim
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      virtcolumn = "100",
      highlight = "VirtColumn",
    },
    config = function(_, opts)
      -- Color sutil para la línea vertical
      vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#313244" })
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#313244" })
        end,
      })
      require("virt-column").setup(opts)
    end,
  },
}
