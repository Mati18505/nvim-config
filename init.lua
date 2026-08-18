require("set")
require("remap")
require("config.lazy")
require("config.lsp")

-- vim.g.auto_save_in_insert_mode = 0

-- tree-sitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    -- fold
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    -- indent
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- wgsl analyzer
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.wgsl",  command = "setfiletype wgsl" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.wesl",  command = "setfiletype wesl" })

function Transparent(color)
  -- set proper colorscheme
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
--Transparent()
