return {
  'lukas-reineke/indent-blankline.nvim',
  enabled = require('nixCatsUtils').enableForCategory 'ui',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  event = 'VeryLazy',
  main = 'ibl',
  opts = { scope = { enabled = false } },
}
