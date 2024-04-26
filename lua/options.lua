-- if you are not sure what an option is doing reading with help manual is a good way to go about it
-- setting linenumbers in the gutter
vim.opt.number = true
vim.opt.relativenumber = true
--split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true
-- related to tabs 
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
-- you can autoindent with >> and deindent with <<

-- synchronises with system clipboard
vim.opt.clipboard = "unnamedplus"
-- behavior wise it works similar to binding j to jzz andk to kzz
vim.opt.scrolloff = 999 
-- treats empty cells also as character in the given particular modes
vim.opt.virtualedit = "block"
-- with search and replacing opens all the location in a split window
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.opt.wrap = true 
