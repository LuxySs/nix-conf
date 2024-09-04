return {
  'nvim-treesitter/nvim-treesitter',
  enabled = require('nixCatsUtils').enableForCategory 'treesitter',
  build = require('nixCatsUtils').lazyAdd ':TSUpdate',
  opts = {
    -- NOTE: nixCats: use lazyAdd to only set these 2 options if nix wasnt involved.
    -- because nix already ensured they were installed.
    ensure_installed = require('nixCatsUtils').lazyAdd { 'bash', 'c', 'cpp', 'lua', 'markdown', 'python', 'rust' },
    auto_install = require('nixCatsUtils').lazyAdd(true, false),
    ignore_install = { 'latex' }, -- because I use vimtex instead

    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
  end,
}
