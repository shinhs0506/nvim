return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUppdate",
	config = function() 
		require('nvim-treesitter').setup {}
	end,
}
