return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.o.termguicolors = true
		vim.g.catpuccin_flavour = "mocha"

		require("catppuccin").setup()

		vim.cmd.colorscheme "catppuccin"
	end,
}
