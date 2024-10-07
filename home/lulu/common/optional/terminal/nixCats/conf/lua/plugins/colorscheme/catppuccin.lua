return {
  'catppuccin/nvim',
  enabled = require('nixCatsUtils').enableForCategory 'general',

  priority = 1000, -- Make sure to load this before all the other start plugins.

  name = 'catppuccin-nvim',
  dev = require('nixCatsUtils').lazyAdd(false, true),

  init = function()
    vim.cmd.colorscheme 'catppuccin'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
