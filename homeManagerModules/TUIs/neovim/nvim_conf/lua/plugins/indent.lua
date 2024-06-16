local programming_ft = require("programming_ft")

return { -- indentation guide
	"lukas-reineke/indent-blankline.nvim",
	ft = programming_ft,
	main = "ibl",
	opts = { scope = { enabled = false } },
}
