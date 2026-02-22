return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
	"stylelint_lsp",
        "emmet_ls",
        "jsonls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "clangd",
        "gopls",
	"zls",
      }
    },
    dependencies = {
        { 
          "mason-org/mason.nvim", 
          opts = {
	    ui = {
	      icons = {
                package_installed = "✓",
	        package_pending = "➜",
	        package_uninstalled = "✗"
	      },
            },
          },
        },

        "neovim/nvim-lspconfig",
    },
}
