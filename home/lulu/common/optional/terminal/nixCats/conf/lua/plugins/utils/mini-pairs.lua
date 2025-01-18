return {
  'echasnovski/mini.pairs',
  enabled = require('nixCatsUtils').enableForCategory { 'utils', 'mini-pairs' },

  version = false,

  opts = {
    mappings = {
      ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
    },
  },
}
