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
        local file_paths = {}
        for _, item in ipairs(harpoon_list.items) do
            if item and item.value and item.value ~= "" then
                table.insert(file_paths, item.value)
            end
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = telescope_conf.file_previewer({}),
            sorter = telescope_conf.generic_sorter({}),
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
