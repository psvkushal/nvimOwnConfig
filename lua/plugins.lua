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
        { 'kepano/flexoki-neovim', name = 'flexoki' },
        { "ellisonleao/gruvbox.nvim" },
        { "rebelot/kanagawa.nvim" },
        { "bluz71/vim-moonfly-colors", name = "moonfly"},
        { "nyoom-engineering/oxocarbon.nvim" },
        -- Some points on treesitter
        -- Check InspectTree command to get the treesitter of the current buffer, it looks cools
        -- nvim-treesitter gives a good endpoint for the core treesitter already present in nvim
        {
                "nvim-treesitter/nvim-treesitter",
                config = function()
                        require("nvim-treesitter.configs").setup {
                                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "java", "go", "javascript"},
                                auto_install = true,
                                highlight = {
                                        enable = true
                                },
                                incremental_selection = {
                                        enable = true,
                                        keymaps = {
                                                init_selection = "<Leader>ss",
                                                node_incremental = "<Leader>si",
                                                scope_incremental = "<Leader>sc",
                                                node_decremental = "<Leader>sd",
                                        },
                                },
                        }
                end
        },
        -- for now I am commenting this one out, I feel I am going to get information overload learning about textobjects now
        -- {"nvim-treesitter/nvim-treesitter-textobjects"} 
        {
                "neovim/nvim-lspconfig",
        },
        {
                "williamboman/mason.nvim",
                config = function()
                        require("mason").setup({
                                ui = {
                                        icons = {
                                                package_installed = "✓",
                                                package_pending = "➜",
                                                package_uninstalled = "✗"
                                        }
                                }
                        })
                end,
        },
        {
               "williamboman/mason-lspconfig.nvim",
               dependencies = { "williamboman/mason.nvim" },
               config = function()
                       require("mason-lspconfig").setup({
                               ensure_installed = { "clangd", "lua_ls", "pylsp", "jdtls", "gopls"} -- I wanted to install gopls too but for some reason there is an error lets do it someother time
                       })
                       require("mason-lspconfig").setup_handlers({
                               -- The first entry (without a key) will be the default handler
                               -- and will be called for each installed server that doesn't have
                               -- a dedicated handler.
                               function (server_name) -- default handler (optional)
                                       require("lspconfig")[server_name].setup {}
                               end,
                               -- Next, you can provide a dedicated handler for specific servers.
                               -- For example, a handler override for the `rust_analyzer`:
                               ["rust_analyzer"] = function ()
                                       require("rust-tools").setup {}
                               end
                       })
               end
        }
})
vim.cmd.colorscheme("gruvbox")
