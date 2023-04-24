return {
	{
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require('catppuccin').setup {
        dim_inactive = {
          enabled = true,
          shade = 'dark',
          percentage = 0.3,
        },
      }
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  }
}
