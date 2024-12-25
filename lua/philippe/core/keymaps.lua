vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("n", "<leader>n", ":nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })
vim.keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Move to the right split window" })
vim.keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Move to the left split window" })

vim.keymap.set("n", "<leader>tao", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tax", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tan", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tap", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>taf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without yanking" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "<leader>to", "<C-w>v:term<CR>a", { desc = "Open new terminal" })
vim.keymap.set("n", "<leader>ta", "<cmd>:term alacritty<CR><C-o>", { desc = "Open Alacritty terminal" })

vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { desc = "Toggle word wrapping" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

vim.keymap.set("n", "<leader>p", ":lua InsertConsoleLog()<CR>", { desc = "Insert console.log statement" })

-- vim.api.nvim_set_keymap("n", "gov", ":DiffviewOpen<CR>", { noremap = true, silent = true }) --options to ensure that the mapping is not recursively mapped
-- vim.api.nvim_set_keymap("n", "goc", ":DiffviewClose<CR>", { noremap = true, silent = true }) --options to ensure that the mapping is not recursively mapped

function InsertConsoleLog()
	-- Move the cursor to the end of the line
	vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), vim.fn.col(".") + 1 })
	-- Insert "console.log()"
	local _, cols = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("iconsole.log('')", true, false, true), "n", true)
	-- Move the cursor inside the parentheses
	vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), vim.fn.col(".") - 3 }) -- Adjust the number based on your needs
end
