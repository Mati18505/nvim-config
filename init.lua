vim.cmd [[
call plug#begin()
Plug 'ThePrimeagen/vim-be-good'
Plug 'mbbill/undotree'
call plug#end()
]]

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

require("config.lazy")
require("config.lsp")

-- Skróty klawiszowe
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-u>', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- Undo persistent
if vim.fn.has("persistent_undo") == 1 then
    vim.opt.undodir = vim.fn.expand("$HOME/.undodir")
    vim.opt.undofile = true
end

function Transparent(color)
    -- set proper colorscheme
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
-- Transparent()
