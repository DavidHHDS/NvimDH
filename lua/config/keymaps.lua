-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                      Atajos de Teclado                                   ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://www.lazyvim.org/keymaps
-- NOTA: Evitamos Ctrl+g, Ctrl+p, Ctrl+t, Ctrl+n, Ctrl+h por conflicto con Zellij

local map = vim.keymap.set

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                           General                                        │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Guardar archivo
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Guardar" })
map("n", "<leader>W", "<cmd>wa<cr>", { desc = "Guardar todo" })

-- Salir
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Salir" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Salir sin guardar" })

-- Limpiar búsqueda
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Limpiar búsqueda" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                    Navegación entre Ventanas                              │
-- └──────────────────────────────────────────────────────────────────────────┘
-- IMPORTANTE: Alt está reservado para Zellij, usamos Ctrl+w para Neovim
--
-- Zellij (Alt):     Alt+p (panes), Alt+t (tabs), Alt+m (move), etc.
-- Neovim (Ctrl+w):  Ctrl+w h/j/k/l para moverse entre splits/ventanas

-- Movimiento entre ventanas de Neovim (nativo con Ctrl+w)
-- Ctrl+w h = izquierda, Ctrl+w j = abajo, Ctrl+w k = arriba, Ctrl+w l = derecha

-- Atajos adicionales con leader para comodidad
map("n", "<leader>wh", "<C-w>h", { desc = "Ventana izquierda" })
map("n", "<leader>wj", "<C-w>j", { desc = "Ventana inferior" })
map("n", "<leader>wk", "<C-w>k", { desc = "Ventana superior" })
map("n", "<leader>wl", "<C-w>l", { desc = "Ventana derecha" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>wc", "<C-w>c", { desc = "Cerrar ventana" })
map("n", "<leader>wo", "<C-w>o", { desc = "Cerrar otras ventanas" })
map("n", "<leader>w=", "<C-w>=", { desc = "Igualar tamaño" })

-- Splits rápidos estilo LazyVim
map("n", "<leader>-", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>|", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>wd", "<C-w>c", { desc = "Cerrar ventana" })
map("n", "<leader>wm", "<cmd>only<cr>", { desc = "Maximizar ventana" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                         Buffers                                          │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Buffer siguiente" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Cerrar buffer" })
map("n", "<leader>bD", "<cmd>%bdelete<cr>", { desc = "Cerrar todos los buffers" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                     Explorador de Archivos                               │
-- └──────────────────────────────────────────────────────────────────────────┘
-- NOTA: <leader>e, <leader>E, <leader>fe, <leader>fE definidos en neo-tree.lua

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                      Pestañas (Tabs)                                     │
-- └──────────────────────────────────────────────────────────────────────────┘
-- Estilo LazyVim: <leader><tab> para gestión de pestañas

map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Nueva pestaña" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Cerrar pestaña" })
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Última pestaña" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Primera pestaña" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Siguiente pestaña" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Pestaña anterior" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Cerrar otras pestañas" })
-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                         Búsqueda (Telescope)                             │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buscar buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Buscar ayuda" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Archivos recientes" })
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Comandos" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Atajos de teclado" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                           LSP                                            │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Ir a definición" })
map("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Ir a declaración" })
map("n", "<leader>lr", vim.lsp.buf.references, { desc = "Ver referencias" })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Ir a implementación" })
map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Tipo de definición" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Mostrar información" })
map("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Firma de función" })
map("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Renombrar símbolo" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Acciones de código" })

-- Diagnósticos
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico" })
map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Siguiente diagnóstico" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { desc = "Lista diagnósticos" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                         Formateo                                         │
-- └──────────────────────────────────────────────────────────────────────────┘

map({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatear" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                          Git                                             │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        Debugging                                         │
-- └──────────────────────────────────────────────────────────────────────────┘

map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continuar" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step into" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step over" })
map("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step out" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "REPL" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminar" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        Utilidades                                        │
-- └──────────────────────────────────────────────────────────────────────────┘

-- Mover líneas en modo visual
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Mover línea abajo" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Mover línea arriba" })

-- Mantener cursor centrado
map("n", "J", "mzJ`z", { desc = "Join lines" })
map("n", "<C-d>", "<C-d>zz", { desc = "Page down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Page up centered" })
map("n", "n", "nzzzv", { desc = "Next search centered" })
map("n", "N", "Nzzzv", { desc = "Prev search centered" })

-- Lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                         Ayuda (prefijos nativos)                         │
-- └──────────────────────────────────────────────────────────────────────────┘
-- Desde <leader>h se puede descubrir cómo acceder a los prefijos nativos

map("n", "<leader>hv", function() require("which-key").show("<C-w>") end, { desc = "Ventanas (Ctrl+w)" })
map("n", "<leader>hg", function() require("which-key").show("g") end, { desc = "Goto (g)" })
map("n", "<leader>hn", function() require("which-key").show("]") end, { desc = "Siguiente (])" })
map("n", "<leader>hp", function() require("which-key").show("[") end, { desc = "Anterior ([)" })
map("n", "<leader>hz", function() require("which-key").show("z") end, { desc = "Folds/Scroll (z)" })
map("n", "<leader>hs", function() require("which-key").show("s") end, { desc = "Surround (s)" })

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │                        Clipboard del Sistema (OSC52)                     │
-- └──────────────────────────────────────────────────────────────────────────┘
-- OSC52 solo puede ESCRIBIR al clipboard, no leer.
-- Para pegar desde el sistema externo: Ctrl+Shift+V (terminal)

-- Copiar al portapapeles del sistema
map("n", "<leader>y", '"+y', { desc = "Copiar al sistema" })
map("v", "<leader>y", '"+y', { desc = "Copiar al sistema" })
map("n", "<leader>Y", '"+Y', { desc = "Copiar línea al sistema" })

