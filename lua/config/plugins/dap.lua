return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      dap.adapters.cppdbg = {
          id = 'cppdbg',
          type = 'executable',
          command = '/home/john/.local/share/nvim/mason/bin/OpenDebugAD7',
      }

      dap.configurations.cpp = {
        {
          name = 'Attach to gdbserver: 1234',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerServerAddress = 'localhost:1234',
          miDebuggerPath = '/usr/bin/gdb',
          cwd = '${workspaceFolder}',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
        }
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
      dap.configurations.rust[1]['miDebuggerPath'] = '/home/john/.cargo/bin/rust-gdb'
      dap.configurations.rust[1]['setupCommands'] = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing"
        }
      }
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function()
      require('dapui').setup {}

      local dap, dapui = require("dap"), require("dapui")
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
  }
}
