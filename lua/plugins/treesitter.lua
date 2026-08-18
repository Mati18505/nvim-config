return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "elixir",
      "heex",
      "eex",
      "lua",
      "bash",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    folds = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
    require'nvim-treesitter'.install { 'rust', 'cpp', 'javascript', 'typescript', 'lua', 'zig', 'go', 'python', 'wgsl', 'elixir', 'eex', 'heex'  }
  end,
}
