return {
  'lukas-reineke/indent-blankline.nvim',
  enabled = require('nixCatsUtils').enableForCategory 'ui',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = { scope = { enabled = false } },
}
