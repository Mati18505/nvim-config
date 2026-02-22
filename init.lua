vim.cmd [[
call plug#begin()
Plug 'ThePrimeagen/vim-be-good'
Plug 'mbbill/undotree'
call plug#end()
]]

vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

require("config.lazy")
require("config.lsp")

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

-- tree-sitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',  -- wszystkie pliki, lub {'cpp','lua','python'}
  callback = function()
    -- fold
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    -- indent
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

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
