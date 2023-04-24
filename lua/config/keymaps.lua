local wk = require('which-key')

local map = function(mode, l, r, desc)
  vim.api.nvim_set_keymap(mode, l, r, { desc = desc, noremap = true, silent = true })
end

-- indent
map('v', '>', '>gv', 'Indent Right')
map('v', '<', '<gv', 'Indent Left')

-- comment
map('v', '<leader>/', 'gc', 'Comment')
map('n', '<leader>/', 'gcc', 'Uncomment')

-- lsp
wk.register({
  l = {
    name = '[l]sp'
  }
}, { prefix = '<leader>' })
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.api.nvim_buf_set_option(ev.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    map('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Op[e]n Float')
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Prev Diagnostic')
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next Diagnostic')

    local buf_map = function(l, r, desc)
      vim.api.nvim_buf_set_keymap(ev.buf, 'n', l, r, { desc = desc, noremap = true, silent = true })
    end

    buf_map('<leader>ld', '<cmd>Telescope lsp_definitions<cr>', '[d]efinition')
    buf_map('<leader>lD', '<cmd>Telescope lsp_declarations<cr>', '[D]eclaration')
    buf_map('<leader>lt', '<cmd>Telescope lsp_type_definitions<cr>', '[t]ype Definition')
    buf_map('<leader>lr', '<cmd>Telescope lsp_references<cr>', '[r]eferences')
    buf_map('<leader>li', '<cmd>Telescope lsp_implementations<cr>', '[i]mplementation')
    buf_map('<leader>lw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', '[w]orkspace symbol')
    buf_map('<leader>lb', '<cmd>Telescope lsp_document_symbols()<cr>', '[b]uffer symbol')
  end,
})

-- Find
wk.register({
  f = {
    name = '[f]ind',
    f = { '<cmd>Telescope find_files<cr>', 'Find [f]ile' },
    g = { '<cmd>Telescope git_files<cr>', 'Find [g]it File' },
    l = { '<cmd>Telescope live_grep<cr>', '[l]ive grep' },
    h = { '<cmd>Telescope help_tags<cr>', '[h]elp tags' },
    k = { '<cmd>Telescope key_maps<cr>', '[k]ey maps' },
  }
}, { prefix = '<leader>' })

-- Explorer
wk.register({
  e = {
    name = '[e]xplore',
    o = { '<cmd>NvimTreeOpen<cr>', '[o]pen Explorer' },
    c = { '<cmd>NvimTreeClose<cr>', '[c]lose Explorer' },
    t = { '<cmd>NvimTreeToggle<cr>', '[t]oggle Explorer' },
  }
}, { prefix = '<leader>' })
