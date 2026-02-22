vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true

-- indents
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- folds
vim.opt.foldenable = false
vim.opt.foldlevelstart = 99

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Undo persistent
if vim.fn.has("persistent_undo") == 1 then
    vim.opt.undodir = vim.fn.expand("$HOME/.undodir")
    vim.opt.undofile = true
end

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "


vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "-", vim.cmd.Oil)
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })
