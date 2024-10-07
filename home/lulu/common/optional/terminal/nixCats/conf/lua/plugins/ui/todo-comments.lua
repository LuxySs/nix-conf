return {
  'folke/todo-comments.nvim',
  enabled = require('nixCatsUtils').enableForCategory 'ui',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'VimEnter',
  opts = {},
}
