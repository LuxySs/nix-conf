return {
  'jmbuhr/otter.nvim',
  -- should also enable it for markdown category
  enabled = require('nixCatsUtils').enableForCategory 'lsp',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
  },
  ft = { 'nix', 'markdown' },
  config = function()
    local otter = require 'otter'
    otter.activate({ 'bash', 'c', 'cpp', 'javascript', 'lua', 'python', 'rust' }, true, true, nil)
  end,
}
