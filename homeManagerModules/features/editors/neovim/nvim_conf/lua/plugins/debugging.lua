local programming_ft = require("programming_ft")

return { -- debugging
	{
		"rcarriga/nvim-dap-ui",
		ft = programming_ft,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
			vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
			vim.keymap.set("n", "<leader>i", ":DapStepInto <CR>")
			vim.keymap.set("n", "<leader>o", ":DapStepOver <CR>")
			vim.keymap.set("n", "<leader>ou", ":DapStepOut <CR>")
			vim.keymap.set("n", "<leader>q", ":DapTerminate <CR>")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		ft = programming_ft,
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		ft = programming_ft,
		config = function(_, _) end,
	},
}
