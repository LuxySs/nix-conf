-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- works weirdly (not basic hjkl resizing)
map('n', '<M-h>', '<c-w>5<')
map('n', '<M-l>', '<c-w>5>')
map('n', '<M-k>', '<c-w>+')
map('n', '<M-j>', '<c-w>-')

-- File browser & tree (oil & Neotree)
map('n', '-', ':Oil<CR>')
map('n', '=', ':Neotree toggle<CR>')

-- compile latex / markdown
map('n', '<leader>ll', function()
  -- Get the current filetype
  local filetype = vim.bo.filetype
  if filetype == 'tex' then
    vim.cmd 'VimtexCompile'
  elseif filetype == 'markdown' then
    vim.cmd 'MarkdownPreviewToggle'
  else
    vim.cmd "echo 'File not compilable'"
  end
end)
