return {
  'stevearc/oil.nvim',
  enabled = require('nixCatsUtils').enableForCategory 'utils',
  event = 'VeryLazy',
  lazy = true,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
}
