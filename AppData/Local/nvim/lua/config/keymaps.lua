-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Return to normal mode
map("i", "jj", "<Esc>", { silent = true })
map("t", "jj", "<C-\\><C-n>", { silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- Files and windows
map("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "Save buffer" })
map("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
map("n", "<leader><tab>", "<cmd>b#<cr>", { noremap = true, desc = "Previously active buffer" })
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>wd", "<C-w>q", { desc = "Close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split window horisontally" })

-- Org Babel
map("n", "<leader>obe", "<cmd>OrgE!<cr>", { noremap = true, desc = "Babel Execute" })
map("n", "<leader>obt", "<cmd>OrgT!<cr>", { noremap = true, desc = "Babel Tangle" })

-- Gen.nvim
map({ "n", "v" }, "<leader>oo", ":Gen<CR>")
map({ "n", "v" }, "<leader>ol", ":lua require('gen').select_model()<CR>")

-- Yank file name
map("n", "<leader>fy", '<cmd>let @" = expand("%:t")<cr>', { noremap = true, desc = "Yank file name" })

-- Emacs-like --

--- Navigation
map("!", "<C-b>", "<Left>", { silent = true })
map("!", "<C-f>", "<Right>", { silent = true })
map("i", "<C-p>", "<Up>", { silent = true })
map("i", "<C-n>", "<Down>", { silent = true })
map("!", "<C-a>", "<Home>", { silent = true })
map("!", "<C-e>", "<End>", { silent = true })
map("i", "<M-a>", "<C-o>(", { silent = true })
map("i", "<M-e>", "<C-o>)", { silent = true })
map("i", "<M-b>", "<C-Left>", { silent = true })
map("c", "<M-b>", "<S-Left>", { silent = true })
map("i", "<M-f>", "<C-o>e<Right>", { silent = true })
map("c", "<M-f>", "<S-Right>", { silent = true })
map("i", "<M-v>", "<PageUp>", { silent = true })
map("i", "<C-v>", "<PageDown>", { silent = true })
--- Copy & Paste
map("!", "<C-d>", "<Del>", { silent = true })
--- Editing
map("!", "<M-BS>", "<C-w>", { silent = true })
map("i", "<C-BS>", "<C-w>", { silent = true })
map("i", "<C-k>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  if #line <= col then
    return "<Del><C-o>dw"
  end
  return "<C-o>dw"
end, { silent = true, expr = true })
map("c", "<C-k>", "<C-f>d$<C-c><End>", { silent = true })
map("i", "<M-d>", function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  if #line <= col then
    return "<Del>"
  end
  return "<C-o>d$"
end, { silent = true, expr = true })
map("i", "<M-k>", "<C-o>d)", { silent = true })
--- Run command
map("t", "<M-x>", "<C-\\><C-n>:")
map("i", "<M-x>", "<Esc>:")
map({ "n", "v" }, "<M-x>", ":")
--- Run external command
map("i", "<M-!>", "<Esc>:!")
map("n", "<M-!>", ":!")
