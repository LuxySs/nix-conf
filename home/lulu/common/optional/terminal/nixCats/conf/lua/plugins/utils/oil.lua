return {
  'stevearc/oil.nvim',
  enabled = require('nixCatsUtils').enableForCategory 'utils',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
}
