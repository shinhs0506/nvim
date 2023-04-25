local options = {
	backup = false,
	swapfile = false,
	undofile = true,
	fileencoding = 'utf-8',

  termguicolors = true,

	showmode = false,

	splitbelow = true,
	splitright = true,

  laststatus = 3,

	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,

	cursorline = true,

	number = true,
	relativenumber = true,

	wrap = false,
	scrolloff = 10,
}

for k,v in pairs(options) do
	vim.opt[k] = v
end
