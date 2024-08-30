-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Return to normal mode with Esc in terminal
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- Files and buffers
map("n", "<leader>fs", "<cmd>w<cr>", { noremap = true, desc = "Save buffer" })
map("n", "<leader>cd", "<cmd>cd %:p:h<cr>", { noremap = true, desc = "cd to this file" })
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })

-- Plugin related below
-- Gen.nvim
map({ "n", "v" }, "<leader>oo", ":Gen<CR>")
map({ "n", "v" }, "<leader>ol", ":lua require('gen').select_model()<CR>")

-- Magit
map({ "n", "v" }, "<leader>gn", ":Neogit cwd=%:p:h<CR>")

-- Org Babel
map("n", "<leader>obe", "<cmd>OrgE!<cr>", { noremap = true, desc = "Babel Execute" })
map("n", "<leader>obt", "<cmd>OrgT!<cr>", { noremap = true, desc = "Babel Tangle" })
