return {

	"hachy/eva01.vim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("eva01")
		-- or
		-- vim.cmd.colorscheme "eva01-LCL"
	end,
}
