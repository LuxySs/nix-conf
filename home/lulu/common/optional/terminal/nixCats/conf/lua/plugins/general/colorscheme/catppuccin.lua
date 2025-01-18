return {
  'catppuccin/nvim',
  enabled = require('nixCatsUtils').enableForCategory {'general', 'colorschemes' },

  name = 'catppuccin-nvim',
  -- name = "catppuccin",
  dev = require('nixCatsUtils').lazyAdd(false, true),

  lazy = false,
  priority = 1000
}
