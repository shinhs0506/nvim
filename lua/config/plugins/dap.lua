return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')
    dap.adapters.lldb = {
      type = 'server',
      host = '127.0.0.1',
      port = 1234,
      command = '/usr/bin/lldb-server',
    }
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/john/.local/share/nvim/mason/bin/OpenDebugAD7',
    }

    dap.configurations.cpp = {
      {
        name = 'LLDB: attach to port 1234',
        type = 'lldb',
        request = 'attach',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        stopOnEntry = false,
      }, {
        name = 'GDB: attach to port 1234',
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

    dap.configurations.rust = {
      {
        name = 'Attach to port: 1234',
        type = 'lldb',
        request = 'attach',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        stopOnEntry = false,
        sourceLanguage = { 'rust' }
      }
    }

  end,
}
