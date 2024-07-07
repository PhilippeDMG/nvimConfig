vim.cmd("let g:netrw_liststyle = 3")

vim.o.background = ""
if vim.g.neovide then
	vim.g.neovide_transparency = 0.5
end
local opt = vim.opt

opt.guicursor = ""

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true --expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false
opt.linebreak = true

-- search settings
opt.ignorecase = true
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)

opt.termguicolors = true
opt.background = ""
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, eof, or insert mode start position

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

--split windows

opt.splitright = true
opt.splitbelow = true
