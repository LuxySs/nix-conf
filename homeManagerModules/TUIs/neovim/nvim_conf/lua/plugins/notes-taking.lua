return { -- notes taking / scientific report
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = { "markdown", "neorg" },
		config = true, -- or `opts = {}`
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"nvim-neorg/neorg",
		ft = { "norg" },
		run = ":Neorg sync-parsers", -- This is the important bit!
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = {
						folds = true,
						icon_preset = "varied",
					},
				},
				["core.summary"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {},
					},
				},
			},
		},
	},

	{ -- latex
		{
			"lervag/vimtex",
			ft = { "tex" },
			init = function() end,
		},
		{
			"evesdropper/luasnip-latex-snippets.nvim",
			ft = { "tex" },
		},
	},
}
