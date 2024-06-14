return {
  "max397574/better-escape.nvim", -- escape insert mod with jj without having delay
  event = "InsertEnter",
  config = function()
    require("better_escape").setup()
  end,
}
