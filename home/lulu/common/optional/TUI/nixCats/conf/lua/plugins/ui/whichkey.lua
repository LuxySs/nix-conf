return {
  'folke/which-key.nvim',
  enabled = require('nixCatsUtils').enableForCategory 'ui',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {},
}
