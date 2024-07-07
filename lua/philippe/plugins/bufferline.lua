return {
	"akinsho/bufferline.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({

			options = {
				mode = "tabs",
				separator_style = "slant",
				show_close_icon = false,
				show_buffer_icons = false,
				show_buffer_close_icons = false,
			},

			highlights = {
				-- where buffers are
				fill = {
					fg = "#00FFFF",
					bg = "#00FFFF",
				},
				buffer_selected = {
					fg = "#000000",
					bg = "#00FFFF",
				},
				separator_selected = {
					fg = "#00FFFF",
					bg = "#00FFFF",
				},
			},
		})
	end,
}
