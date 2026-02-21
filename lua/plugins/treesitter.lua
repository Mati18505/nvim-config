return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'help', 'rust', 'cpp', 'javascript', 'typescript', 'lua', 'zig' },
    highlight = { enable = true },
    indent = { enable = true },
    folds = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
