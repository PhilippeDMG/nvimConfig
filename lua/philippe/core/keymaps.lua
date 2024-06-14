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

-- Toggle word wrapping
vim.api.nvim_set_keymap("n", "<leader>z", ":set wrap!<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "J", "", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "K", "<cmd>lua move_line_up_by_two()<CR>", { noremap = true, silent = true })
--
-- function move_line_up_by_two()
-- 	-- Enter visual mode and select the current line
-- 	vim.cmd("normal! V")
-- 	-- Move the selected line up by 2 lines
-- 	vim.cmd(":m-2")
-- end
