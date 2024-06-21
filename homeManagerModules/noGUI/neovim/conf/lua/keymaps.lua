-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

local map = vim.keymap.set

-- File browser & tree (oil & Neotree)
map("n", "-", ":Oil<CR>")
map("n", "=", ":NvimTreeToggle<CR>")

-- Function that compiles latex and markdown documents
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

-- compile latex / markdown
map("n", "<leader>ll", function()
	-- Get the current filetype
	local filetype = vim.bo.filetype
	if filetype == "tex" then
		vim.cmd("VimtexCompile")
	elseif filetype == "markdown" then
		vim.cmd("MarkdownPreviewToggle")
	else
		vim.cmd("echo 'File not compilable'")
	end
end)
