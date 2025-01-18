return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  enabled = require('nixCatsUtils').enableForCategory 'utils',

  -- fix different name from url for nixCats
  name = 'harpoon2',
  dev = require('nixCatsUtils').lazyAdd(false, true),

  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'VeryLazy',
  config = function()
    local harpoon = require 'harpoon'
    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>n', function()
      harpoon:list():add()
    end)

    -- can be overwritten by the telescope menu down there
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>hs', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>hd', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>hf', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- vim.keymap.set("n", "<C-e>", function()
    -- 	toggle_telescope(harpoon:list())
    -- end, { desc = "Open harpoon window" })
  end,
}
