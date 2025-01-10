return {
  'catgoose/nvim-colorizer.lua',
  enabled = require('nixCatsUtils').enableForCategory 'utils',
  cmd = { 'ColorizerToggle' },
  opts = {
    user_default_options = { mode = 'foreground' },
  },
}
