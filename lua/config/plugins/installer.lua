return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup {}
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require("mason-lspconfig").setup {}
			require("mason-lspconfig").setup_handlers {
				function (server)
					require("lspconfig")[server].setup {
            capabilities = capabilities
          }
				end,
			}
		end,
	}
}
