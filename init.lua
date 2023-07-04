if vim.g.vscode then
  vim.cmd('source $HOME/.config/nvim/vscode.vim')
  require('$HOME/.config/nvim/lua/config/options.lua')
else
  require('config.lazy')
  require('config.options')
  require('config.keymaps')
end
