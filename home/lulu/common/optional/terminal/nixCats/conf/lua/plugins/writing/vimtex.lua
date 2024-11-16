return {
  'lervag/vimtex',
  enabled = require('nixCatsUtils').enableForCategory 'latex',
  ft = { 'tex' },
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'lualatex --shell-escape'
  end,
}
