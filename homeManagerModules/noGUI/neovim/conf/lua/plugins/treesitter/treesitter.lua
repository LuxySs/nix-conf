return {
  -- don't forget the ignore_install = { "latex" } for vimtex
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
        ignore_install = { "latex" },
      })
  end
}
