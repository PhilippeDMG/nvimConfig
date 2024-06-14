return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"css",
			"html",
			"svelte",
			"jsx",
			"lua",
			"js",
			"py",
			"ts",
			"tsx",
		})
	end,
}
