return {
  'saghen/blink.cmp',
  enabled = require('nixCatsUtils').enableForCategory 'completion',
  dependencies = 'rafamadriz/friendly-snippets',

  opts = {
    keymap = {
      preset = 'default',
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal',
    },

    signature = { enabled = true },

    fuzzy = {
      prebuilt_binaries = {
        download = false,
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },

  opts_extend = { 'sources.default' },
}
