return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>Alpha<CR>", { noremap = true, silent = true }) --options to ensure that the mapping is not recursively mapped

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			-- "                                                     ",
			-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⠶⠒⢋⣉⣭⠷⠶⠶⠒⠂⠀⠀⠀⠀⠀⠈⠉⠉⠙⠒⠶⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⠶⣾⡍⢁⣀⣠⠶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠑⠶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠉⣿⣾⣿⣿⣷⣽⣷⣿⠶⠶⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⣄⠀⠀⠀⠀⠀⠀",
			-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣶⡿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣧⣌⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣝⠶⡀⠀⠀⠀",
			-- "⠀⠀⠀⠀⠀⠀⠀⠀⣰⠛⣿⣿⣷⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣶⡀⠢⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⡙⠶⣄⠀",
			-- "⠀⠀⠀⠀⠀⠀⠀⣰⡇⠀⣿⣿⣿⣿⣿⡟⠉⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡿⣺⣀⣀⡀⠄⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣨⣿⣢⡘⠦",
			-- "⠀⠀⠀⠀⠀⢀⣴⣿⣇⠀⣸⣿⡿⠟⠁⠀⢀⡏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣾⡀⣀⡀⠠⠀⠀⠚⢤⠂⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⣀⣷⣿⡓⠆⠀",
			-- "⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⡟⠉⠀⠀⠀⠀⣾⠃⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣗⣦⣴⡜⣿⣇⢀⢉⠀⣀⣨⣀⣤⣴⣴⣿⣽⣽⣿⡿⠂⠀",
			-- "⠀⠀⠀⣼⣽⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⣼⡿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣯⣷⣿⣿⣿⣿⡿⣿⢁⣤⣾⣷",
			-- "⠀⠀⣴⢩⣿⣯⣿⠃⠀⠀⠀⠀⠀⠀⢠⢏⡇⠀⠀⡿⢹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⣻⣤⣾⣿⣿⣿⣿",
			-- "⠀⢰⢯⠋⣜⣾⠃⠀⠀⠀⠀⠀⠀⠀⡾⢸⠁⡄⣴⡇⠘⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⣿⣿⣼⣹⠇⠀⠀⠀⠀⠀⠀⠀⢠⠃⣿⢰⣿⣿⡇⠀⢸⣿⣿⣿⣿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⢸⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⣿⣿⣿⣿⣧⠀⢸⣿⣿⡏⣿⠀⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⢸⣻⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⣿⣿⣿⣿⣿⣧⣾⣿⣿⠀⣿⠀⠀⠏⣿⣿⣿⣿⣿⣿⣿⣏⣽⣿⣿⣿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⢸⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⢰⣿⣿⢙⢻⣿⣿⠻⣏⣿⠀⣿⡀⣤⣀⠋⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⣿⣿⣿⡇⠀⠀⠀⠀⠠⠤⣶⣴⣿⠀⢸⣿⣿⠀⢸⣏⠁⠈⢻⡟⠀⣷⣇⣿⣿⣾⣸⣿⣿⣿⣿⣿⣿⣦⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⣿⢻⣿⠁⠀⠀⠀⠀⠀⠀⠀⠉⡏⠀⢸⣿⢻⡀⢸⡏⠀⠠⣶⡇⠀⢻⢻⣿⣿⣽⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⣿⠈⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⢸⣾⠘⣇⠈⡇⠀⠈⢻⠃⠙⠻⡿⣿⣿⣿⡾⢿⣿⣎⣿⣿⣿⣿⣿⣿⣿⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⢹⣦⣽⣿⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⢸⣿⠀⢹⡆⣧⠀⠀⡟⠀⠀⠀⣿⠹⣿⡟⢿⡈⢑⣙⣿⡟⣿⣿⣿⣿⡇⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⢧⡀⣿⡏⠉⢹⣿⣷⣶⣔⠲⣆⠀⠀⣿⠀⠀⢻⣿⡀⢸⡇⠀⠀⠀⠸⡄⢻⣿⠘⢧⡅⡊⢿⡇⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠉⣿⢧⡀⢰⡍⣙⣿⣿⣷⢏⠶⠀⢿⡀⠀⠀⠹⣇⣼⠁⠀⠀⠀⠀⢷⠀⢻⡄⠘⢷⣄⣹⡇⠸⣿⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⣿⠀⠙⠮⣷⣍⡹⠟⢿⣿⡀⠀⠀⠁⠀⠀⠀⢹⡿⢶⣒⣒⣒⣂⣈⡂⠀⠁⠀⠈⢻⣿⡇⠀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⡿⠀⠀⠀⠀⠈⠙⠳⠶⣟⠁⠀⠀⠀⠀⠀⠀⠀⠐⠛⠛⠛⠛⢻⣿⣿⣿⣶⣦⢤⡀⠹⡇⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣏⡿⠋⠁⠀⠹⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠠⡟⢊⣁⡤⣖⡋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢲⣤⡽⠿⢿⣿⠿⣿⣷⣗⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⠃⢀⢴⡖⠛⠛⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⣟⣩⠵⠊⠉⢀⣀⠀⢠⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠒⠺⠷⢤⣀⡈⠛⠳⠦⣉⣽⣷⣄⣸⣿⣿⣿⣿⣿⣿⡿⢴⣏⣀⣙⠲⠶⢿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⣿⠀⠐⠓⠒⠉⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠈⠉⠙⠒⠶⠿⠋⠀⠈⣿⣿⣿⣿⣿⣿⣿⡇⢰⠀⠀⠘⠦⡀⢸⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠖⠚⠉⠁⠀⠀⣀⠔⠃⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⢀⣠⡼⠁⣠⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠉⢀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⡴⠛⠉⠁⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⠀⠈⣿⣆⠀⠀⠀⠀⠘⢷⣶⠢⠤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⠀⡄⣿⣿⣷⡄⠀⠀⠀⠀⣿⣄⡀⠀⠀⠉⠛⠒⠤⣄⣀⣀⣀⣀⣤⡾⠃⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷⣾⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⠀⣇⣿⣿⣿⣿⣦⡀⠀⠀⠀⠳⣅⡀⠀⠀⠀⠠⢤⣤⡄⣠⣤⡶⠛⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⠘⣟⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			-- "⠀⠀⠀⢰⣿⣿⣿⣿⡟⣿⣿⣄⠀⠀⠀⠀⠉⠓⠦⣤⣤⣤⣤⠽⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣿⣿⣿⣿⣿⣿⣿⡟⠀⠸⣿⣦⣬⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿",
			-- "⠀⠀⠀⢸⢻⣿⣿⣿⡇⠹⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣿⣟⢿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠘⣻⠇⠈⢿⡉⠉⠉⠛⢿⡇⠀⠤",
			-- "⠀⠀⠀⣼⣸⣿⣿⣿⠁⠀⠙⢿⣿⣿⣦⣀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣶⣾⣿⣿⣿⣿⡿⠟⠁⣸⣿⣿⣿⣿⣿⠿⣿⠃⠀⢀⡼⠃⠀⠀⠀⠻⣦⡀⠀⠈⢻⡄⠀",
			-- "⠀⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀⢀⡿⠃⠀⠉⠛⠛⠛⣻⠟⠉⠀⣠⠋⢙⣿⣿⣿⣿⡟⠋⠀⠀⢰⣿⣿⣟⡸⢸⣿⡷⣿⠀⣠⠞⠀⠀⠀⠀⠀⠀⣿⣿⡀⠀⠈⢳⡄",
			-- "⠀⠀⢰⢿⣿⣿⣿⡟⠀⠀⢀⡞⠀⠀⠀⠀⠀⢀⡼⠁⠀⢠⠞⢁⡴⠋⠘⢧⠛⠁⠀⠀⠀⠀⣼⡿⣿⠈⠛⣿⣿⣺⣇⠞⠁⠀⠀⠀⠀⠀⠀⢠⡇⠹⡇⠀⠀⠀⠙",
			-- "⠀⠀⣾⢸⣿⣿⣿⡇⠀⠀⡾⠀⠀⠀⠀⠀⣠⠞⠀⠀⣠⠏⡰⠋⠀⠀⠀⠈⢧⠀⠀⠀⠀⢰⣿⢣⡿⠀⠐⠛⠽⢽⠃⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠁⠀⠀⠀⠀",
			-- "⠀⢀⠏⣿⣿⣿⣿⠀⠀⢰⡇⠀⠀⠀⠀⣰⣿⣾⣿⣿⣷⠞⠁⠀⠀⠀⠀⠀⣠⣧⠀⠀⠀⣸⡇⢸⣇⠀⠀⠀⠠⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⠀⠀⠀",
			-- "⠀⣾⠀⣿⣿⢿⣿⠀⠀⢸⠀⠀⠀⠀⣰⣿⣿⣿⣽⡿⠃⠀⠀⠀⠀⠀⠀⣾⡿⠙⢧⡀⢰⡟⠀⢸⠋⠀⠀⠀⢙⡏⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀",
			-- "⠀⠏⢰⣿⣿⢸⡏⡆⠀⢸⡄⠀⠀⢀⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⣾⢿⡀⠀⠀⠁⡾⠁⠀⢸⠀⠀⠀⠀⣾⠁⠀⠀⠀⠀⠀⠀⠀⢰⠏⠀⠀⠀⠀⠀⠀⠀⠀",
			-- "⠸⠀⣾⣿⣿⢸⣇⠇⠀⠈⣇⠀⠀⣿⣿⣿⣿⠃⣠⣦⡀⠀⠀⠀⢀⡾⠉⠀⠙⢲⣀⣸⠃⠀⠀⢼⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("SPC c", "Go to nvim dotconfig", "<cmd>e ~/.config/nvim/<CR>"),
			dashboard.button("caipib", "Go to caipi backend", "<cmd>e ~/dev/nestjs/caipi_backend_nestjs/<CR>"),
			dashboard.button("palm", "Go to palmer frontend", "<cmd>e ~/dev/svelte/palmer_inmobiliaria_front/<CR>"),
			dashboard.button("aina", "Go to aina chatbot", "<cmd>e ~/dev/nestjs/aina_back_nestjs/<CR>"),
			dashboard.button("caipif", "Go to caipi frontend", "<cmd>e ~/dev/svelte/caipi_frontend_sveltekit/<CR>"),
			dashboard.button("recl", "Go to reclamos", "<cmd>e ~/dev/svelte/reclamos_front_sveltekit/<CR>"),
			dashboard.button("mecp", "Go to python mec", "<cmd>e ~/dev/python/mec_python_desercion/<CR>"),
			dashboard.button("mecn", "Go to nestjs mec", "<cmd>e ~/dev/nestjs/mec_nestjs/<CR>"),
			dashboard.button("meca", "Go to mec alertas", "<cmd>e ~/dev/react/mec_alertas/<CR>"),
			dashboard.button("desa", "Go to desarrollo project", "<cmd>e ~/dev/react/Proyecto-Desarrollo/<CR>"),
			dashboard.button("tob", "Go to tob site", "<cmd>e ~/dev/react/tob_site/<CR>"),
			dashboard.button("pe", "Go to project euler", "<cmd>e ~/dev/python/peuler/<CR>"),
			dashboard.button("hy", "Go to hyprland config", "<cmd>e ~/.config/hypr/hyprland.conf<CR>"),
			dashboard.button("comp", "Svelte Compiler", "<cmd>e ~/dev/svelte/compiler/<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
