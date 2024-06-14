vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Navigate between panes,
-- uncomment if not using tmux with tmux navigator
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- File browser & tree (oil & Neotree)
vim.keymap.set("n", "<C-o>", ":Oil<CR>", { desc = "Open Oil (file browser)" })
vim.keymap.set("n", "<C-f>", ":Neotree toggle<CR>", { desc = "Open file tree (file tree)" })

-- Terminal
vim.keymap.set("n", "<A-t>", ":ToggleTerm direction=horizontal <CR>", { desc = "Open Terminal bottom" })
vim.keymap.set("n", "<A-f>", ":ToggleTerm direction=float <CR>", { desc = "Open Terminal floating" })

-- Outline
vim.keymap.set("n", "<leader>ot", ":Outline <CR>", { desc = "Open Terminal bottom" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- function that compiles latex and markdown documents
function customFileTypeAction()
	-- Get the current filetype
	local filetype = vim.bo.filetype
	if filetype == "tex" then
		vim.cmd("VimtexCompile")
	elseif filetype == "markdown" then
		vim.cmd("MarkdownPreviewToggle")
	else
		vim.cmd("echo 'File not compilable'")
	end
end

vim.api.nvim_set_keymap("n", "<leader>ll", ":lua customFileTypeAction()<CR>", { noremap = true })
