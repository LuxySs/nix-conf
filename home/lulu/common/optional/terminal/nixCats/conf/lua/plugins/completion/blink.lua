return {
  'saghen/blink.cmp',
  enabled = require('nixCatsUtils').enableForCategory 'completion',
  dependencies = 'rafamadriz/friendly-snippets',

  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'default' },

    fuzzy = {
        prebuilt_binaries = {
            download = false,
        },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },

  opts_extend = { "sources.default" }
}
