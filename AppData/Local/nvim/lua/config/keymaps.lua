-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Return to normal mode
vim.keymap.set("i", "jj", "<Esc>", { silent = true })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { silent = true })

-- Files and windows
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "Save buffer" })
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { noremap = true, desc = "Delete other windows" })

-- Org Babel
vim.keymap.set("n", "<leader>obe", "<cmd>OrgE!<cr>", { noremap = true, desc = "Babel Execute" })
vim.keymap.set("n", "<leader>obt", "<cmd>OrgT!<cr>", { noremap = true, desc = "Babel Tangle" })

-- NeoGit
vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<cr>", { noremap = true, desc = "Neogit status (root dir)" })
vim.keymap.set("n", "<leader>gN", "<cmd>Neogit cwd=%:p:h<cr>", { noremap = true, desc = "Neogit status (cwd)" })

-- Gen.nvim
vim.keymap.set({ "n", "v" }, "<leader>oo", ":Gen<CR>")
vim.keymap.set({ "n", "v" }, "<leader>ol", ":lua require('gen').select_model()<CR>")

-- Yank buffer name
vim.keymap.set({ "n" }, "<leader>by", ":let @0 = expand("%:t")<CR>", { noremap = true, desc = "Yank buffer name" })

-- Emacs-like --

--- Navigation
vim.keymap.set("!", "<C-b>", "<Left>", { silent = true })
vim.keymap.set("!", "<C-f>", "<Right>", { silent = true })
vim.keymap.set("i", "<C-p>", "<Up>", { silent = true })
vim.keymap.set("i", "<C-n>", "<Down>", { silent = true })
vim.keymap.set("!", "<C-a>", "<Home>", { silent = true })
vim.keymap.set("!", "<C-e>", "<End>", { silent = true })
vim.keymap.set("i", "<M-a>", "<C-o>(", { silent = true })
vim.keymap.set("i", "<M-e>", "<C-o>)", { silent = true })
vim.keymap.set("i", "<M-b>", "<C-Left>", { silent = true })
vim.keymap.set("c", "<M-b>", "<S-Left>", { silent = true })
vim.keymap.set("i", "<M-f>", "<C-o>e<Right>", { silent = true })
vim.keymap.set("c", "<M-f>", "<S-Right>", { silent = true })
vim.keymap.set("i", "<M-v>", "<PageUp>", { silent = true })
vim.keymap.set("i", "<C-v>", "<PageDown>", { silent = true })
--- Copy & Paste
vim.keymap.set("!", "<C-d>", "<Del>", { silent = true })
--- Editing
vim.keymap.set("!", "<M-BS>", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-k>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  if #line <= col then
    return "<Del><C-o>dw"
  end
  return "<C-o>dw"
end, { silent = true, expr = true })
vim.keymap.set("c", "<C-k>", "<C-f>d$<C-c><End>", { silent = true })
vim.keymap.set("i", "<M-d>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  if #line <= col then
    return "<Del>"
  end
  return "<C-o>d$"
end, { silent = true, expr = true })
vim.keymap.set("i", "<M-k>", "<C-o>d)", { silent = true })
--- Run command
vim.keymap.set("i", "<M-x>", "<Esc>:")
vim.keymap.set("n", "<M-x>", ":")
--- Run external command
vim.keymap.set("i", "<M-!>", "<Esc>:!")
vim.keymap.set("n", "<M-!>", ":!")
