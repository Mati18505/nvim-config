require("set")
require("remap")
require("config.lazy")
require("config.lsp")

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

function Transparent(color)
    -- set proper colorscheme
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
-- Transparent()
