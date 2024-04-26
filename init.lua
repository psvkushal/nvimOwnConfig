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
-- installs lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })
end
-- adds lazy to the nvim runtime path.Example if neovim has to check whether a particular non standard package is present or not it will look if that non standard is provided libraries in the runtime path
-- simpler way to say would be, neovim cant do syntax highlighting for c or c++ by itself, so it will ask for each libraries in the runtime to check if they can support that feature themselves
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        -- color schemes
        -- { 'kepano/flexoki-neovim', name = 'flexoki' },
        -- { "ellisonleao/gruvbox.nvim" },
        -- { "rebelot/kanagawa.nvim" },
        -- { "bluz71/vim-moonfly-colors", name = "moonfly"},
        { "nyoom-engineering/oxocarbon.nvim" }
})
vim.cmd.colorscheme("oxocarbon")
