vim.g.mapleader = " "

-- and to suppress any output when the mapping is executed.
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true }) --options to ensure that the mapping is not recursively mapped
vim.api.nvim_set_keymap("i", "JK", "<ESC>", { noremap = true, silent = true }) --options to ensure that the mapping is not recursively mapped
vim.api.nvim_set_keymap("n", "<leader>n", ":nohl<CR>", { noremap = true, silent = true }) -- clear search hightlights

vim.api.nvim_set_keymap("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true }) -- split window vertically
-- vim.api.nvim_set_keymap("n", "<leader>sho", "<C-w>s", { noremap = true, silent = true }) -- split window horizontally
vim.api.nvim_set_keymap("n", "<leader>se", "<C-w>=", { noremap = true, silent = true }) -- make split windows equal size
vim.api.nvim_set_keymap("n", "<leader>sx", "<cmd>close<CR>", { noremap = true, silent = true }) -- close current split window
vim.api.nvim_set_keymap("n", "<leader>sl", "<C-w>l", { noremap = true, silent = true }) -- close current split window
vim.api.nvim_set_keymap("n", "<leader>sh", "<C-w>h", { noremap = true, silent = true }) -- close current split window

vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>tabnew<CR>", { noremap = true, silent = true }) -- open new tab
vim.api.nvim_set_keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { noremap = true, silent = true }) -- close current tab
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>tabn<CR>", { noremap = true, silent = true }) -- go to next tab
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>tabp<CR>", { noremap = true, silent = true }) -- go to previous tab
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { noremap = true, silent = true }) -- open current buffer in new tab

-- greatest remap ever
vim.api.nvim_set_keymap("v", "<leader>p", '"_dP', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Toggle word wrapping
vim.api.nvim_set_keymap("n", "<leader>z", ":set wrap!<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gdv", ":DiffviewOpen<CR>", { noremap = true, silent = true }) --options to ensure that the mapping is not recursively mapped
vim.api.nvim_set_keymap("n", "gdc", ":DiffviewClose<CR>", { noremap = true, silent = true }) --options to ensure that the mapping is not recursively mapped

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- console.log
vim.api.nvim_set_keymap("n", "<leader>p", ":lua InsertConsoleLog()<CR>", {
	noremap = true,
})

function InsertConsoleLog()
	-- Move the cursor to the end of the line
	vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), vim.fn.col(".") + 1 })
	-- Insert "console.log()"
	local _, cols = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("iconsole.log('')", true, false, true), "n", true)
	-- Move the cursor inside the parentheses
	vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), vim.fn.col(".") - 3 }) -- Adjust the number based on your needs
end
