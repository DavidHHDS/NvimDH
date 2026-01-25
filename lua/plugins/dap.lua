-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                           nvim-dap: Debugging                            ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- Fuente: https://github.com/mfussenegger/nvim-dap

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        keys = {
          { "<leader>du", function() require("dapui").toggle() end, desc = "DAP UI" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Evaluar", mode = { "n", "v" } },
        },
        opts = {},
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
      -- Virtual text
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condición: ")) end, desc = "Breakpoint condicional" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continuar" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Hasta cursor" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pausar" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "REPL" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminar" },
    },
    config = function()
      local dap = require("dap")

      -- Signos
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition" })
      vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStopped" })

      -- Python (debugpy)
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Archivo actual",
          program = "${file}",
          pythonPath = function()
            local venv = os.getenv("VIRTUAL_ENV")
            return venv and (venv .. "/bin/python") or "python3"
          end,
        },
      }

      -- JavaScript/TypeScript (node)
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
        dap.configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Archivo actual",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
