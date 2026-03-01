return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    local telescope_conf = require("telescope.config").values

    harpoon:setup()

    local function toggle_telescope(harpoon_list)
      local finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_list.items) do
          table.insert(paths, item.value)
        end

        return require("telescope.finders").new_table({
          results = paths,
        })
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = finder(),
        previewer = telescope_conf.file_previewer({}),
        sorter = telescope_conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          map("i", "<C-d>", function()
            local state = require("telescope.actions.state")
            local selected_entry = state.get_selected_entry()
            local current_picker = state.get_current_picker(prompt_bufnr)

            table.remove(harpoon_list.items, selected_entry.index)
            current_picker:refresh(finder())
          end)
          return true
        end,
      }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, {
      desc = "Open harpoon window",
    })

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Mark file with harpoon" })
    vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show harpoon marks" })
    vim.keymap.set("n", "<leader>n", function() harpoon:list():select(1) end, { desc = "Harpoon buffer 1" })
    vim.keymap.set("n", "<leader>e", function() harpoon:list():select(2) end, { desc = "Harpoon buffer 2" })
    vim.keymap.set("n", "<leader>i", function() harpoon:list():select(3) end, { desc = "Harpoon buffer 3" })
    vim.keymap.set("n", "<leader>o", function() harpoon:list():select(4) end, { desc = "Harpoon buffer 4" })
  end,
}
