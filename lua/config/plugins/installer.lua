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
			require("mason-lspconfig").setup {}
			require("mason-lspconfig").setup_handlers {
				function (server)
					require("lspconfig")[server].setup {}
				end,
			}
		end,
	}
}
